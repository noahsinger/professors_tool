require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
   xxx@xxx.xxx = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, meeting: { xxx@xxx.xxx }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should show meeting" do
    get :show, xxx@xxx.xxx
    assert_response :success
  end

  test "should get edit" do
    get :edit, xxx@xxx.xxx
    assert_response :success
  end

  test "should update meeting" do
    put :update, id: @meeting, meeting: { xxx@xxx.xxx }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, xxx@xxx.xxx
    end

    assert_redirected_to meetings_path
  end
end
