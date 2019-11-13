class SearchController < ApplicationController
  RESULTS_CONST = 10 # Number of results to display per page

  def search
    # Check if search variable present
    if params.has_key?(:search)
      terms = search_params
      # Check if searching by query or by ISBN
      unless terms[:isbn].blank?
        @results = Book.where(isbn: terms[:isbn].strip)
      else
        # Note: Also catches cases where all vars are empty
        # Create case insensitive query
        result = Book.arel_table
        @results = Book.all
        @results = @results.where(result[:title].matches "%#{terms[:title]}%") unless terms[:title].blank?
        @results = @results.where(result[:author].matches "%#{terms[:author]}%") unless terms[:author].blank?
        #@results = @results.where("title LIKE ?", "%#{terms[:title]}%") unless terms[:title].blank?
        #@results = @results.where("author LIKE ?", "%#{terms[:author]}%") unless terms[:author].blank?
      end
    else
      @results = Book.all
    end

    # Pagination
    @results_count = @results.count
    @pages = @results_count / RESULTS_CONST + 1
    @page = (params[:page] || 1).to_i
    # Select subset of results using page number
    @results = @results.limit(RESULTS_CONST).offset(RESULTS_CONST * (@page - 1))
    # Compute links to different pages
    @links = Array.new(@pages - 1)
    @pages.times do |i|
      @links[i] = search_path(params.merge(page: i + 1).permit({search: [:title, :author]}, :page))
    end

    # Optimize for image query
    @results = @results.with_attached_image
  end

  private

  def search_params
    params.require(:search).permit(:title, :author, :isbn)
  end
end
