class Food < ApplicationRecord
  validates :name, presence: true
  
  def self.search(search_string)
    like_query = "%#{search_string}%".downcase
    Food.where("lower(foods.name) LIKE ?", like_query).limit(1)[0]
  end
end
