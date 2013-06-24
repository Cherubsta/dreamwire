class PagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build
      redirect_to @current_user
    end
  end

  def feed
    if signed_in?
      @feed_items = current_user.feed
    end
  end

  def login
  end 

  def signup
  end
end
