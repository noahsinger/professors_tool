require 'test_helper'

class WaitersControllerTest < ActionDispatch::IntegrationTest
  setup do
   xxx@xxx.xxx = waiters(:one)
  end

  test "should get new" do
    get xxx@xxx.xxx
    assert_response :success
  end

  test "should create waiter" do
    assert_difference('Waiter.count') do
      post course_waiters_url(@waiter.course), params: {waiter: {email: xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx
  end

  test "should not a create waiter if their address is already used" do
    assert_no_difference('Waiter.count') do
      post course_waiters_url(@waiter.course), params: {waiter: {email: xxx@xxx.xxx
    end

    assert_response :success
  end
end
