require 'test_helper'

class GradeRequestTest < ActiveSupport::TestCase
  test "grade requests exist" do
    assert_equal 2, GradeRequest.count
  end
end
