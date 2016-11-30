require 'test_helper'

class GeneralContactTest < ActiveSupport::TestCase
  test "general contacts exist" do
    assert_equal 1, GeneralContact.count
  end
  
  test "general contacts can be emailed" do
    assert_difference('Delayed::Job.all.size') do
      GeneralContact.first.send_email
    end
  end
end
