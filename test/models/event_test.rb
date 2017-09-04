require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = exercises(:breakfast)
  end
  
  test "should be valid" do
    assert @event.valid?
  end

  test "type should be present" do
    @event.type = nil
    assert_not @event.valid?
  end
end
