class SessionsController < ApplicationController
    
    def new
    end

    def create 
        if request.env['omniauth.auth']

            user = User.create_with_omniauth(request.env['omniauth.auth'])
            session[:user_id] = user.id    
            redirect_to user_path(user.id)
        else
        @user = User.find_by(email: params[:session][:email])
    
        if @user != nil 

            if @user.authenticate(params[:session][:password])
                session[:user_id] = @user.id 
            
                redirect_to posts_path
            else
                redirect_to '/login'
            end
        else
            redirect_to '/login'
        end
        end
    end

    def destroy
        if !current_user
            redirect_to posts_path
        else
        session.destroy
       # @current_user = nil 
        redirect_to login_path
        end
    end

    protected 

    def auth
        request.env['omniauth.auth']
      end

end
