class UsersController < ApplicationController

    def new
        @user = User.new 
        10.times {@user.identities.build}

    end

    def create

        user = User.create(user_params)

           if user.save
             session[:user_id] = user.id
             redirect_to '/posts'
           else
    
             render 'new'
           end
    end
  


    
    private
    
    def user_params 
        params.require(:user).permit(
            :password,
            :first_name,
            :last_name,
            :email,
            identities:[
                :name,
                :standard
            ]
        )
    end
end
