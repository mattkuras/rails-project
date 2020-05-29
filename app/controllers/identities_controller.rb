class IdentitiesController < ApplicationController
    def new 
        @identity = Identity.new 
    end

    def create
        identity = current_user.identity.build(identity_params)
        identity.save 
        if identity.save 
            redirect_to posts_path 
        else
            render 'new'
        end 
    end
end