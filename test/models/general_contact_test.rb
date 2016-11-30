require 'test_helper'

class GeneralContactTest < ActiveJob::TestCase
  test "general contacts exist" do
    assert_equal 1, GeneralContact.count
  end
  
  test "general contacts can be emailed" do
    assert_enqueued_jobs 1 do 
      GeneralContact.first.send_email
    end
  end
end
