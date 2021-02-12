class PostsController < ApplicationController
  # def import
  #   Post.import(params[:file])
  #   redirect_to posts_url
  # end
  before_action :set_posts, only: [:index, :create]

  PREVIEW = 5

  def index
  end

  def create
    Post.create(post_params)
  end
  
  private
  def post_params
    params.require(:post).permit(:month, :method, :payee, :amount, :note)
  end
end
