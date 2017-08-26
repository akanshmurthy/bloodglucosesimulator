require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = Exercise.new(name: "crunches")
  end
  
  test "should be valid" do
    assert @exercise.valid?
  end

  test "name should be present" do
    @exercise.name = nil
    assert_not @user.valid?
  end
end
