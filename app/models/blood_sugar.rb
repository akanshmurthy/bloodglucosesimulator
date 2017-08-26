class BloodSugar < ApplicationRecord
  validates :level, presence: true
  
  def self.update_blood_sugar_level(quantity)
    last_blood_sugar_level = BloodSugar.last
    # + - depending on logic
  end
    
end
