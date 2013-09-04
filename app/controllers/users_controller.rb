class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user,   only: [:edit, :update, :show]
  before_filter :admin_user,     only: :destroy

  def index
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def menu
    @user = current_user
  end

  def show 
  	@user = User.find(params[:id])
    @dreams = @user.dreams
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      UserMailer.registration_confirmation(@user).deliver
      sign_in @user
      flash[:success] = "Successful Login"
  		redirect_to @user
  	else
  		render 'new' 
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Account Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Destroyed"
    redirect_to users_path
  end

  private 
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
