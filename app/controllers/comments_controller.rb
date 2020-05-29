class CommentsController < ApplicationController

    def new 
        @comment = Comment.new 
    end

    def create 
        comment = current_user.comments.build(content: params[:content])
        comment.save 
        if comment.save 
            redirect_to(comment_path)
        else 
            redirect_to(comment_path)
        end
    end

end
