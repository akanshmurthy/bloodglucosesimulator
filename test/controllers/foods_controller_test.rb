require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @food = foods(:jelly)
  end

  test "should redirect to root after create" do
    post foods_url, params: { food: { name: @food.name, glycemic_index: @food.glycemic_index} }
    assert_redirected_to root_url
  end

end
