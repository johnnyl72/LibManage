class SearchController < ApplicationController
  RESULTS_CONST = 10

  def search
    if params.has_key?(:search)
      terms = search_params
      unless terms[:isbn].blank?
        @results = Book.where(isbn: terms[:isbn])
      else
        @results = Book.all
        @results = @results.where("title LIKE ?", "%#{terms[:title]}%") unless terms[:title].blank?
        @results = @results.where("author LIKE ?", "%#{terms[:author]}%") unless terms[:author].blank?
      end
    else
      @results = Book.all
    end
    @results_count = @results.count
    @pages = @results_count / RESULTS_CONST + 1
    @page = (params[:page] || 1).to_i
    @results = @results.limit(RESULTS_CONST).offset(RESULTS_CONST * (@page - 1))
    @links = Array.new(@pages - 1)
    @pages.times do |i|
      @links[i] = search_path(params.merge(page: i + 1).permit({search: [:title, :author]}, :page))
    end
  end

  private

  def search_params
    params.require(:search).permit(:title, :author, :isbn)
  end
end
