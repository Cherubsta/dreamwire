class SessionsController < ApplicationController

	def new
	end

	def create
		if 
			user = User.find_by_email(params[:session][:username_or_email].downcase)
		else
			user = User.find_by_username(params[:session][:username_or_email].downcase)
		end

		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = "Invalid email/username or password"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
