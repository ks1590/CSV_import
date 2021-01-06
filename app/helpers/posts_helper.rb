module PostsHelper
  def converting_to_jpy(amount)
    "#{amount.to_s(:delimited, delimiter: ',')}円"
  end
end
