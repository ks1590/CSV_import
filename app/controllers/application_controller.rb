class ApplicationController < ActionController::Base
  def set_posts
    @posts = Post.current_month.default
    @current_year_sum = Post.current_year.group(:payee).sum(:amount)
    @last_year_sum = Post.last_year.group(:payee).sum(:amount)
    @current_month_sum = Post.current_month.group(:payee).sum(:amount)
    @last_month_sum = Post.last_month.group(:payee).sum(:amount)
  end
end
