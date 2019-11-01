class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:pos, :management, :purchasing, :user_status]
  before_action :authorize_admin, only: [:pos, :management, :purchasing]

  def home
    if(current_user && current_user.admin?)
      flash.now[:info] = "Logged in as admin"
      #redirect_to management_url

    elsif(current_user)
      #redirect_to user_status_url
    end
  end

  def about
  end

  def management
  end

  def pos
  end

  def shelving
  end

  def news
  end

  def purchasing
  end

  def user_status
  end
end
