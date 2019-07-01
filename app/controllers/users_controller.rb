class UsersController < ApplicationController
  
  def new
    @user = User.new
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


  private
    # Private method for User params
    def user_params
      params.require(:user).permit(:Fname, :Lname, :email, :password, :password_confirmation)
    end
end
