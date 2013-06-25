class PostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def new
		@post = current_user.posts.build(params[:post])
	end

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Dream Saved!"
			redirect_to @current_user
		else
			@feed_items = current_user.feed
			render 'posts/new'
		end
	end

	def feed
    if signed_in?
      @feed_items = current_user.feed
    end
  end

  def show
  	if signed_in?
      @post = Post.find(params[:id])
    end
  end

	def destroy
	end
end