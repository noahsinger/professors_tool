require 'test_helper'

class SemestersControllerTest < ActionDispatch::IntegrationTest
  test "should_get_index" do
    get semesters_url
    assert_response :success
    assert_not_nil assigns(:semesters)
  end
end
