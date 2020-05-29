class CommentsController < ApplicationController

    def new 
        @comment = Comment.new 
    end

    def create 
        comment = current_user.comments.build(comment_params)
        comment.save 
        byebug
        if comment.save 
            redirect_to (comment_path)
        else 
            redirect_to (comment_path)
        end
    end

    private

    def comment_params 
        params.require(:comment).permit(:content)
    end
end
