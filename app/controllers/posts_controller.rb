class PostsController < ApplicationController
  # def import
  #   Post.import(params[:file])
  #   redirect_to posts_url
  # end

  PREVIEW = 5

  def index
    @posts = Post.page(params[:page]).per(PREVIEW)
    @post = Post.new
  end

  def create
    Post.create(post_params)
    @posts = Post.all
  end
  
  private
  def post_params
    params.require(:post).permit(:month, :method, :payee, :amount, :note)
  end
end
