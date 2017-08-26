require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = exercises(:crunches)
  end
  
  test "should be valid" do
    assert @exercise.valid?
  end

  test "name should be present" do
    @exercise.name = nil
    assert_not @exercise.valid?
  end
end
