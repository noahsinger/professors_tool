require 'test_helper'

class Admin::AssignmentTweetsControllerTest < ActionController::TestCase
  def setup
    login_as(:admin)
  end  
  
  test "should get new" do
    get :new, :assignment_id => assignments(:lab01).id, :status => 'graded'
    assert_response :success
  end
  
  test "should post to create tweet and redirect" do
    Tweet.any_instance.expects(:send).returns(true)
    post :create, content: "tweeting from unit test", assignment_id: assignments(:lab01).id
  end

end
