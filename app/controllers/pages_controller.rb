class PagesController < ApplicationController
  
  before_filter :signed_in_user, only: [:info]

  def home
    if signed_in?
      redirect_to @current_user
    end
  end

  def info
  end

  def login
  end 

  def signup
  end
end
