class Post < ApplicationRecord
  # def self.import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     post = find_by(id: row["id"]) || new
  #     post.attributes = row.to_hash.slice(*updatable_attributes)
  #     post.save
  #   end
  # end

  # def self.updatable_attributes
  #   ["id", "month", "method", "payee", "amount", "note"]
  # end

  scope :default, -> { order(month: :asc)}

  current_month = Date.today
  current_year = Date.today.all_year
  last_year = Date.today.prev_year.all_year

  # 今月
  scope :current_month, -> { where(month: current_month.beginning_of_month..current_month.end_of_month) }
  # 先月（2020年）
  scope :last_month, -> { where(month: current_month.prev_month.beginning_of_month..current_month.prev_month.end_of_month) }

  scope :current_year, -> { where(:month => current_year)}
  scope :last_year, -> { where(:month => last_year)}
end
