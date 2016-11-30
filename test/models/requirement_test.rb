require 'test_helper'

class RequirementTest < ActiveSupport::TestCase
  test "requirements exist" do
    assert_equal 3, Requirement.count
  end
end
