class IdentitiesController < ApplicationController
    def new
        @new_identities = []
        10.times do |t|
        @new_identities << Identity.new
        end
        @communities = Community.all 
       
    end

    def create
    byebug
        identity = current_user.identity.build(identity_params)
        if identity.save 
            redirect_to user_path(current_user)
        else
            render 'new'
        end 
    end

    private 

    def identity_params 
        params.require(:identity).permit(
            :name,
            :standard,
            :progress
        )
    end

end