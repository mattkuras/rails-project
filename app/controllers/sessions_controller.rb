class SessionsController < ApplicationController
    
    def new
    end

    def create 
        
        @user = User.find_by(email: params[:session][:email])
        
        if @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id 
            
            redirect_to posts_path
        else
            redirect_to '/login'
        end
    end

    def destroy
        if !current_user
            redirect_to posts_path
        else
        session.destroy
        @current_user = nil 
        redirect_to login_path
        end
    end

end
