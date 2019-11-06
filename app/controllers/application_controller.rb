class ApplicationController < ActionController::Base
  
  include CurrentCart
  before_action :set_cart

  def authorize_admin
    redirect_to(root_url) unless current_user && current_user.admin
  end

end
