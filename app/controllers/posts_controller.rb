class PostsController < ApplicationController
  def show 
    #     if com_params? 
        @post = Post.all.find_by(id: params[:id])
          @comments = @post.comments.all
          @current_user = current_user
  end

  def index 
    @like = Like.new
    if params[:community_id] 
        
      @posts = Community.find_by(id: params[:community_id]).posts
    else
      @posts = Post.all.reg_posts
      @user = current_user
    end
  end
    

  def new 
    @post = Post.new 
  end

  def create
    
      @post = current_user.posts.build(post_params)

      if @post.save
        if params[:community_id]
          redirect_to community_posts_path
        else

          redirect_to posts_path 
        end
      else
        render :new
      end
  end

  def show 
    @post = Post.all.find_by(id: params[:id])
    @like = Like.new
    @comments = @post.comments.all if @post
    @comment = Comment.new
    @current_user = current_user
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
          :user_id,
          :community_id
        )
  end

end
