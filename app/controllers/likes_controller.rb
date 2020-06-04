class LikesController < ApplicationController
    before_action :find_post

    def new 
      @like = Like.new
    end

    def create
      @post.likes.build(like_params)
      byebug
      if @post.save
        redirect_to post_path(@post)
      else
        redirect_to posts_path
      end  
   end

   private

   def like_params
    params.require(:like).permite(:user_id, :post_id)
   end
   
    def find_post
      
      @post = Post.find_by(params[:post_id])
    end

 end