class PagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build
      redirect_to @current_user
    end
  end

  def login
  end 

  def signup
  end
end
