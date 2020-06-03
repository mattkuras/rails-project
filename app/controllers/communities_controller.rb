class CommunitiesController < ApplicationController

    def show
        @community = Community.find_by(id: params[:id])
    
    end
end
