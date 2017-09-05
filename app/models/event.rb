class Event < ApplicationRecord
  validates :event_type, presence: true
  
  def self.calculate_blood_sugar(glycation = false)
    calculate_increments_based_on_events
    calculate_blood_sugar_based_on_increments
    calculate_glycation(glycation)
  end
  
  def self.calculate_increments_based_on_events
    @events = Event.where("created_at >= ?", Time.now.beginning_of_day)
    @blood_sugar_array = Array.new(1440, 0)
    @events.each do |event|
      starting_minute = DateTime.parse(event.created_at.to_s).seconds_since_midnight / 60
      index_change_amount = event.event_type == "food" ? (event.index / 120.to_f) : -(event.index / 60.to_f)
      ending_minute = event.event_type == "food" ? (starting_minute + 120) : (starting_minute + 60)
      ending_minute = 1440 if ending_minute > 1440

      (starting_minute..ending_minute).each do |minute|
        @blood_sugar_array[minute-1] = @blood_sugar_array[minute-1] + index_change_amount
      end
    end
  end
  
  def self.calculate_blood_sugar_based_on_increments
    @blood_sugar_array[0] = 80 
    i = 0
    while i < @blood_sugar_array.length
      if @blood_sugar_array[i] != 0 && ((i+1) <= @blood_sugar_array.length - 1)
        @blood_sugar_array[i+1] += @blood_sugar_array[i] 
      elsif @blood_sugar_array[i] == 0 && ((i+1) <= @blood_sugar_array.length - 1)
        @blood_sugar_array[i+1] = @blood_sugar_array[i]
        normalize_if_no_food_or_exercise(i)
      end
      i += 1
    end
  end
  
  def self.normalize_if_no_food_or_exercise
    if @blood_sugar_array[i+1] > 80
      @blood_sugar_array[i+1] -= 1
    else
      @blood_sugar_array[i+1] += 1
    end
  end
  
  def self.calculate_glycation(glycation)
    if glycation
      @glycation_array = Array.new(1440, 0)
      @blood_sugar_array.each_with_index do |level, i|
        if level > 150
          @glycation_array[i] += 1
        end
      end
      @glycation_array
    else
      @blood_sugar_array
    end
  end
  
end
