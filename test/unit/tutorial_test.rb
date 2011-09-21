require 'test_helper'

class TutorialTest < ActiveSupport::TestCase
  test "tutorials exist" do
    assert_equal 2, Tutorial.count
  end
end
