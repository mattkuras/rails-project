module PostsHelper
    def com_params?
        !!params[:community_id]
    end
end
