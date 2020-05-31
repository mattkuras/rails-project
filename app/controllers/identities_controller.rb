class IdentitiesController < ApplicationController
    def new
        @new_identities = []
        @identities = ['Musician', "Writer", 'Father', 'Mother', 'Athlete', 'Traveler', 'Teacher', 'Artist', 'Cook']
    end

    def create
    byebug
        identity = current_user.identity.build(identity_params)
        identity.save 
        if identity.save 
            redirect_to posts_path 
        else
            render 'new'
        end 
    end
end