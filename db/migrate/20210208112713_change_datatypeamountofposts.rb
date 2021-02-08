class ChangeDatatypeamountofposts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :amount, :float
    change_column :posts, :month, :date
  end
end
