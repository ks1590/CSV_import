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
    @data = [5, 6, 3, 1, 2, 4, 7]    

    # @h = LazyHighCharts::HighChart.new("graph") do |f|
    #   f.chart(:type => "column")
    #   # f.title(:text => "月間支出")
    #   f.xAxis(:categories => @categories)
    #   f.series(:name => "小計",
    #           :data => @data)
    # end

    # product_A_sales = [ 1_000_000, 1_200_000, 1_300_000,
    #   1_400_000, 1_200_000, 1_100_000 ]
    # product_B_sales = [   300_000,   500_000,   750_000,
    #   1_150_000, 1_350_000, 1_600_000 ] 

    @food = Post.current_month.where(payee: "食費").sum(:amount)
    @fun = Post.current_month.where(payee: "交際費").sum(:amount)
    @cloth = Post.current_month.where(payee: "衣類").sum(:amount)
    @net = Post.current_month.where(payee: "通信費").sum(:amount)
    @shopping = Post.current_month.where(payee: "買い物").sum(:amount)

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      # c.title(text: "製品別上期売上")
      c.series({
      colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{
          name: '食費',
          # y: product_A_sales.reduce{|sum,e| sum + e}
          y: @food
        }, {
          name: '交際費',    
          y: @fun
      }, {
          name: '衣類', 
          y: @cloth
      }, {
          name: '通信', 
          y: @net
      }, {
          name: '買い物', 
          y: @shopping
      }]
      })
      c.plotOptions(pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '{point.name}: {point.percentage:.1f} %',
      }
      })
      # グラフの種類として「パイチャート」を指定
      c.chart(type: "pie")
    end
  end

  def create
    Post.create(post_params)
    @posts = Post.order(month: :desc).page(params[:page]).per(PREVIEW)
    @current_month = Post.current_month.sum(:amount)
    @last_month = Post.last_month.sum(:amount)

    @food = Post.current_month.where(payee: "食費").sum(:amount)
    @fun = Post.current_month.where(payee: "交際費").sum(:amount)
    @cloth = Post.current_month.where(payee: "衣類").sum(:amount)
    @net = Post.current_month.where(payee: "通信費").sum(:amount)
    @shopping = Post.current_month.where(payee: "買い物").sum(:amount)

    @chart = LazyHighCharts::HighChart.new("graph") do |c|
      # c.title(text: "製品別上期売上")
      c.series({
      colorByPoint: true,
        # ここでは各月の売上額合計をグラフの値とする
        data: [{
          name: '食費',
          # y: product_A_sales.reduce{|sum,e| sum + e}
          y: @food
        }, {
          name: '交際費',    
          y: @fun
      }, {
          name: '衣類', 
          y: @cloth
      }, {
          name: '通信', 
          y: @net
      }, {
          name: '買い物', 
          y: @shopping
      }]
      })
      c.plotOptions(pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '{point.name}: {point.percentage:.1f} %',
      }
      })
      # グラフの種類として「パイチャート」を指定
      c.chart(type: "pie")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:month, :method, :payee, :amount, :note)
  end
end
