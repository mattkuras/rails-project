class PostsController < ApplicationController

    def index 
        @posts = Post.all 
    end

    def new 
        @post = Post.new 
    end

    def create

        @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    def show 
      @post = Post.all.find_by(id: params[:id])
      @comments = @post.comments.all
    end

    def destroy
      post = Post.all.find_by(id: params[:id])
      post.delete
      redirect_to posts_path
    end

    private 
    
    def post_params 
        params.require(:post).permit(
          :content,
          :user_id)
    end
end
