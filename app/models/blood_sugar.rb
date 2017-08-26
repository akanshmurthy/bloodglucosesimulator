class BloodSugar < ApplicationRecord
  validates :level, presence: true
end
