module SessionsHelper

    # aassignes the user's id to user_id symbol in sessions 
    # hash for easy retrieval of user information from database using id
    def log_in(user)
        session[:user_id] = user.id 
    end


    def remember(user)
      user.remember
      # signed = encrypte the cokkie
      # permanent = we want the user id to be paired with the permanent remember token
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end


    # know that the user logged in
    def current_user
        if (user_id = session[:user_id])
          @current_user ||= User.find_by(id: session[:user_id])
        elsif (user_id = cookies.signed[:user_id])
          user = User.find_by(id: user_id)
          if user && user.authenticate?(cookies[:remember_token])
            log_in user
            @current_user = user
          end
        end
    end

    # cookie delete
    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end

    # check if the user is looged in
     def logged_in?
        !current_user.nil?
     end

     def log_out
        forget(current_user)

        # delete current session
        session.delete(:user_id)
        @current_user = nil
      end
end
