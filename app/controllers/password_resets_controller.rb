class PasswordResetsController < ApplicationController
  def new
  end

  def create
	  user = User.find_by_email(params[:email].downcase)
	  user.send_password_reset if user
	  redirect_to new_session_path
	  flash[:error] = "Please check your email now..."
	end

	def edit
	  @user = User.find_by_password_reset_token!(params[:id])
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path
	    flash[:error] = "Password reset has expired, please try again."
	  elsif @user.update_attributes(params[:user])
	    redirect_to new_session_path
	    flash[:error] = "Your password was changed! You may now sign in."
	  else
	    render :edit
	  end
	end

end