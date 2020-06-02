class SessionsController < ApplicationController
    
    def new
    end

    def create 
        if params[:password == nil] || params[:password].empty?
            redirect_to '/login'
        else
            session[:user_id] = params[:user_id]
            redirect_to '/'
        end
    end

    def destroy
        if !current_user
            redirect_to posts_path
        else
        session.destroy
        redirect_to login_path
        end
    end

end
