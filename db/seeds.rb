month_name = ["1月", "2月", "3月", "4月", "5月", "6月"]
method_name = ["現金", "電子マネー", "QRコード", "口座振替", "クレジット"]
payee_name = ["食費", "日用品", "交際費", "衣類", "コンテンツ", "交通費"]

10.times do |n|
  month = month_name.sample
  method = method_name.sample
  payee = payee_name.sample

  # amount = Faker::Number.within(range: 100..30000).
  amount = 100

  Post.create!(
    month: month,
    method: method,
    payee: payee,
    amount: amount
  )
end