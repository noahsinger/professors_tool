require 'test_helper'

class WaitersControllerTest < ActionController::TestCase
  setup do
   xxx@xxx.xxx = waiters(:one)
  end

  test "should get new" do
    get :new, xxx@xxx.xxx
    assert_response :success
  end

  test "should create waiter" do
    assert_difference('Waiter.count') do
      post :create, course_id: @waiter.course.id, :waiter => {:email => xxx@xxx.xxx
    end

    assert_redirected_to xxx@xxx.xxx
  end

  test "should not a create waiter if their address is already used" do
    assert_no_difference('Waiter.count') do
      post :create, course_id: @waiter.course.id, xxx@xxx.xxx
    end

    assert_response :success
  end
end
