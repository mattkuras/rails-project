class LikesController < ApplicationController
    
  def new 
    @like = Like.new
  end

  def create
    @post = Post.find_by(id: params[:like][:post_id])
    if @post.likes.any? {|like| like.user.id == current_user.id}
      redirect_to posts_path 
    else

    @like = @post.likes.build(like_params)
      if @like.save
        
        if !params[:like][:post_id]
        redirect_to posts_path
        else 
          redirect_to post_path(@post)
        end
      else
        redirect_to posts_path
      end
    end
  end

  def index
    @post = Post.find_by(id: params[:post_id])
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end

 end