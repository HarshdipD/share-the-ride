module SessionsHelper

    # this method takes in user as a parameter and assignes the user's id to user_id symbol in sessions 
    # hash for easy retrieval of user information from database using id
    def log_in(user)
        session[:user_id] = user.id 
    end

    # We also need a way to know the user logged in.
   
    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    

    # check if the user is looged in
     def logged_in?
        !current_user.nil?
     end

     def log_out
        session.delete(:user_id)
        @current_user = nil
      end
end
