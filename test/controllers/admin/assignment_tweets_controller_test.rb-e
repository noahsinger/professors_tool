require 'test_helper'

class Admin::AssignmentTweetsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/assignment_tweets', {},
                        {assignment_id: 1}                => :post,
                        {action: 'new', assignment_id: 1} => :get)

  def setup
    login_as(:admin)
  end

  test "should get new" do
    get new_admin_assignment_tweet_url, params: {assignment_id: assignments(:lab01).id, status: 'graded'}
    assert_response :success
  end

  test "should post to create tweet and redirect" do
    Tweet.any_instance.expects(:send).returns(true)
    post admin_assignment_tweets_url, params: {content: "tweeting from unit test", assignment_id: assignments(:lab01).id}
  end

end
