class UsersController < ApplicationController

    def new
        if !current_user
        @user = User.new 
        10.times {@user.identities.build}
        else
            redirect_to posts_path
        end
    end

    def index
        @users = User.search(params[:search])
    end

    def create

        @user = User.new(user_params)

        @user.identities.each do |i|
            i.name = i.community.name 
        end
      #  byebug
           if @user.save
            
             session[:user_id] = @user.id
             redirect_to '/posts'
           else
            10.times {@user.identities.build}
             render 'new'
            
           end
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.all.find_by(id: params[:id])
        5.times {@user.identities.build}
    end

    def update 
        @user = User.find_by(id: params[:id])
        @user.identities.each do |i|
            i.name = i.community.name 
        end
        @user.update(user_params)
        redirect_to posts_path
    end

  


    
    private
    
    def user_params 
        params.require(:user).permit(
            :password,
            :first_name,
            :last_name,
            :email,
            :search,
            identities_attributes:[
                :community_id,
                :standard
            ]
        )
    end

    
end
