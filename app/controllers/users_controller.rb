class UsersController < ApplicationController

    def new
        @user = User.new 
    end

    def create

        user = User.create(user_params)
        user.save

        
           if user.save
             session[:user_id] = user.id
             redirect_to posts_path
           else
            byebug
             render 'new'
           end
        end
  


    
    private
    
    def user_params 
        params.require(:user).permit(
            :password,
            :first_name,
            :last_name,
            :email
        )
    end
end
