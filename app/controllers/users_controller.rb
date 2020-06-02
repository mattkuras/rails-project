class UsersController < ApplicationController

    def new
        if !current_user
        @user = User.new 
        10.times {@user.identities.build}
        else
            redirect_to posts_path
        end

    end

    def create

        user = User.new(user_params)

        user.identities.each do |i|
            i.name = i.community.name 
        end
        
           if user.save
            
             session[:user_id] = user.id
             redirect_to '/posts'
           else
    
             render 'new'
           end
    end

    def show 
        @user = User.find_by(id: params[:id])
    end
  


    
    private
    
    def user_params 
        params.require(:user).permit(
            :password,
            :first_name,
            :last_name,
            :email,
            identities_attributes:[
                :community_id,
                :standard
            ]
        )
    end

    
end
