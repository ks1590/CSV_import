class PostsController < ApplicationController
  # def import
  #   Post.import(params[:file])
  #   redirect_to posts_url
  # end
  before_action :set_posts, only: [:index, :create]

  PREVIEW = 10

  def index
    @posts = Post.order(month: :desc).page(params[:page]).per(PREVIEW)
    @post = Post.new

    @end_at = Date.today
    @start_at = @end_at - 6
    @categories = @start_at.upto(@end_at).to_a
    # @data = [5, 6, 3, 1, 2, 4, 7]
    @data = []

    @h = LazyHighCharts::HighChart.new("graph") do |f|
      f.chart(:type => "column")
      # f.title(:text => "月間支出")
      f.xAxis(:categories => @categories)
      f.series(:name => "小計",
              :data => @data)
    end
  end

  def create
    Post.create(post_params)
    @posts = Post.order(month: :desc).page(params[:page]).per(PREVIEW)
    @current_month = Post.current_month.sum(:amount)
    @last_month = Post.last_month.sum(:amount)
  end
  
  private
  def post_params
    params.require(:post).permit(:month, :method, :payee, :amount, :note)
  end
end
