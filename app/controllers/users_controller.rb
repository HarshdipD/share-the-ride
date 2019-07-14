class UsersController < ApplicationController

  # only logged in user can edit and update
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to share the Ride!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    # Private method for User params
    def user_params
      params.require(:user).permit(:Fname, :Lname, :email, :password, :password_confirmation)
    end

    # check if the user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in to access this page"
        redirect_to login_url
      end
    end

    # method for checking the current use is accessing their own settings page
    def correct_user
      @user = User.find(prams[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
