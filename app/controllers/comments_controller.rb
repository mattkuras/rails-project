class CommentsController < ApplicationController

    def new 
        @comment = Comment.new 
    end

    def create 
        comment = current_user.comments.build(comment_params)

        if comment.save 
            redirect_to post_path(comment.post)
        else 
            redirect_to post_path(comment.post)
        end
    end

    private

    def comment_params 
        params.require(:comment).permit(:content, :post_id)
    end
end
