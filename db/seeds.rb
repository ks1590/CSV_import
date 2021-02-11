start_date = Date.parse("2021/01/01")
end_date = Date.parse("2021/5/31")
method_name = ["現金", "電子マネー", "QRコード", "口座振替・デビット", "クレジット"]
payee_name = ["食費", "日用品", "交際費", "衣類", "コンテンツ", "交通費"]

1500.times do |n|
  month_name = Random.rand(start_date .. end_date)
  month = month_name
  method = method_name.sample
  payee = payee_name.sample
  amount = Faker::Number.within(range: 100..30000)

  Post.create!(
    month: month,
    method: method,
    payee: payee,
    amount: amount
  )
end