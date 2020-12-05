class Post < ActiveRecord::Migration[5.2]
  def change
      add_column :posts, :month, :string
      add_column :posts, :method, :string
      add_column :posts, :payee, :string
      add_column :posts, :amount, :integer
      add_column :posts, :note, :text
  end
end
