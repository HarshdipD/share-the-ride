class SessionsController < ApplicationController
  def new
  end
  
  def create 
    #find the user in our User Db using find_by method
    user = User.find_by(email: params[:session][:email].downcase)
    # authenticate the user password. 
    if user && user.authenticate(params[:session][:password])
      # if everythig is corect then redirect it to user's show page
      log_in user        
      redirect_to user      # Here instead of redirecting to user We need to redirect it to a page where there is information of all the posts. This page is yet to be made
    else 
      #show an error 
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
