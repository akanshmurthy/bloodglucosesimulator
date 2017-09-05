require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:breakfast)
  end
  
  test "should be valid" do
    assert @event.valid?
  end

  test "type should be present" do
    @event.event_type = nil
    assert_not @event.valid?
  end
end
