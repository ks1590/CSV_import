class ChangeLevelofPyament < ActiveRecord::Migration[5.2]
  def up
    Payment.create(name:"現金")
    Payment.create(name:"口座振替・デビットカード")
    Payment.create(name:"クレジットカード")
    Payment.create(name:"電子マネー")
    Payment.create(name:"QRコード")
  end
end
