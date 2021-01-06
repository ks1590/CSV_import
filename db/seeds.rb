100.times do |n|
  amount = Faker::Number.within(range: 100..30000).

  Post.create!(
    month: "11月",
    method: "現金",
    payee: "食費",
    amount: amount
  )
end