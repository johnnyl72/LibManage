class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:pos, :user_status]
  # before_action :authenticate_admin, only: [:managerment]
  def home
    if(current_user.admin?)
      flash[:info] = "Logged in as admin"
    end
  end

  def about
  end

  def management
  end

  def pos
  end

  def news
  end

  def purchasing
  end

  def user_status
  end
end
