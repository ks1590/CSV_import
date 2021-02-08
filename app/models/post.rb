class Post < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      post = find_by(id: row["id"]) || new
      post.attributes = row.to_hash.slice(*updatable_attributes)
      post.save
    end
  end

  def self.updatable_attributes
    ["id", "month", "method", "payee", "amount", "note"]
  end
end
