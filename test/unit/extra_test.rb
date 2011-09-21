require 'test_helper'

class ExtraTest < ActiveSupport::TestCase
  test "extras exist" do
    assert_equal 1, Extra.count
  end
end
