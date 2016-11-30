require 'test_helper'

class HomeworkReturnRequestTest < ActiveSupport::TestCase
  test "homework return requests exist" do
    assert_equal 2, HomeworkReturnRequest.count
  end
end
