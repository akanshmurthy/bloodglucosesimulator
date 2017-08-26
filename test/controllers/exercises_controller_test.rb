require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @exercise = exercises(:crunches)
  end

  test "should redirect to root after create" do
    post :create
    assert_redirected_to root_url
  end
  
end
