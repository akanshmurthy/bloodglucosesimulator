require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @exercise = exercises(:crunches)
  end

  test "should redirect to root after create" do
    post exercises_url, params: { exercise: { name: @exercise.name, exercise_index: @exercise.exercise_index} }
    assert_redirected_to root_url
  end
  
end
