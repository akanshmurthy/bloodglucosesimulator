class Exercise < ApplicationRecord
  validates :name, presence: true
  
  def self.search(search_string)
    like_query = "%#{search_string}%".downcase
    Exercise.where("lower(exercises.name) LIKE ?", like_query).limit(1)[0]
  end
end
