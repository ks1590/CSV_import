class ChangeLevelofPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :payment
  end
end
