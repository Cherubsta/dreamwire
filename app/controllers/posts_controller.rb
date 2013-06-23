class PostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Dream Saved!"
			redirect_to root_path
		else
			render 'posts/create'
		end
	end

	def destroy
	end
end