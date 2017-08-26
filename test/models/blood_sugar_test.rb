require 'test_helper'

class BloodSugarTest < ActiveSupport::TestCase
  def setup
    @blood_sugar = BloodSugar.new(level: 80)
  end
  
  test "should be valid" do
    assert @blood_sugar.valid?
  end

  test "level should be present" do
    @blood_sugar.level = nil
    assert_not @blood_sugar.valid?
  end
end
