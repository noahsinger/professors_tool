require 'test_helper'

class LabTest < ActiveSupport::TestCase
  test "labs exist" do
    assert_equal 2, Lab.count
  end
  
  test "labs have worth" do
    assert_respond_to Lab.first, :worth
    assert_equal 100, Lab.find(1).worth
  end
end
