class PostsController < ApplicationController
  def index
    @posts = Post.all    
  end

  def import
    Post.import(params[:file])
    redirect_to posts_url
  end
  
end
