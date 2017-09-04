class BloodSugar < ApplicationRecord
  validates :level, presence: true
  
  def self.update_blood_sugar_level(quantity, type)
    
    last_blood_sugar = BloodSugar.where("created_at >= ?", Time.zone.now.beginning_of_day).last
    
    if last_blood_sugar.nil?
      last_blood_sugar = BloodSugar.create(level: 80)
    end
    
    if (type == "food")
      calculate_blood_sugar_if_food_eaten(last_blood_sugar, quantity)
    end
    
    if (type == "exercise")
      calculate_blood_sugar_if_exercise_done(last_blood_sugar, quantity)
    end
  end
  
  def self.calculate_blood_sugar_if_food_eaten(last_blood_sugar, quantity)
    updated_blood_sugar_level = BloodSugar.new
    updated_blood_sugar_level.level = last_blood_sugar.level + quantity
    updated_blood_sugar_level.created_at = Time.now + (60 * 60 * 2)
    updated_blood_sugar_level.save
  end
  
  def self.calculate_blood_sugar_if_exercise_done(last_blood_sugar, quantity)
    updated_blood_sugar_level = BloodSugar.new
    updated_blood_sugar_level.level = last_blood_sugar.level - quantity
    updated_blood_sugar_level.created_at = Time.now + (60 * 60 * 1)
    updated_blood_sugar_level.save
  end

end
