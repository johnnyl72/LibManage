class SearchController < ApplicationController
  RESULTS_CONST = 10

  def search
    if params.has_key?(:search)
      terms = search_params
      unless terms[:isbn].blank?
        @results = Book.where(isbn: terms[:isbn]).limit(RESULTS_CONST)
      else
        @results = Book.all.limit(RESULTS_CONST)
        @results = @results.where("title LIKE ?", "%#{terms[:title]}%") unless terms[:title].blank?
        @results = @results.where("author LIKE ?", "%#{terms[:author]}%") unless terms[:author].blank?
      end
    else
      @results = Book.all.limit(RESULTS_CONST)
    end
  end

  private

  def search_params
    params.require(:search).permit(:title, :author, :isbn)
  end
end
