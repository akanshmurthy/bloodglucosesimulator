require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  def setup
    @food = Food.new(name: "jelly")
  end
  
  test "should be valid" do
    assert @food.valid?
  end

  test "name should be present" do
    @food.name = nil
    assert_not @food.valid?
  end
end
