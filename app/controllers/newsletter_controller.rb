class NewsletterController < ApplicationController
  before_action :set_newsletter, only: [:destroy]

   def create
     @newsletter = Newsletter.create(newsletter_params)
     if @newsletter.save
       redirect_to management_path
     else
       redirect_to root_path
     end
   end

   private

     def set_newsletter
       @newsletter = Newsletter.find(params[:id])
     end

     def newsletter_params
       params.require(:newsletter).permit(:email)
     end

end
