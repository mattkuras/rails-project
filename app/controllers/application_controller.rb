class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :verified_user 
  helper_method :user_is_authenticated
    def verified_user
        redirect_to '/' unless user_is_authenticated
      end
   
     def user_is_authenticated
       !!current_user
     end
   
     def current_user
       User.find_by(id: session[:user_id])
     end
     
end
