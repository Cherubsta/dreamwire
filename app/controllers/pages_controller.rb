class PagesController < ApplicationController
  def home
    if signed_in?
      redirect_to @current_user
    end
  end

  def login
  end 

  def signup
  end
end
