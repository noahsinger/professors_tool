require 'test_helper'

class HowToTest < ActiveSupport::TestCase
  test "how to's exist" do
    assert_equal 2, HowTo.count
  end
end
