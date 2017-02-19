require 'test_helper'

class WaitersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waiter = waiters(:one)
  end

  test "should get new" do
    get new_course_waiter_url(@waiter.course)
    assert_response :success
  end

  test "should create waiter" do
    assert_difference('Waiter.count') do
      post course_waiters_url(@waiter.course), params: {waiter: {email: 'test@test.com'}}
    end

    assert_redirected_to course_path(@waiter.course)
  end

  test "should not a create waiter if their address is already used" do
    assert_no_difference('Waiter.count') do
      post course_waiters_url(@waiter.course), params: {waiter: {email: "noah@threesuns.org"}}
    end

    assert_response :success
  end
end
