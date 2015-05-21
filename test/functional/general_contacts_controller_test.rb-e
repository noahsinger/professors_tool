require 'test_helper'

class GeneralContactsControllerTest < ActionController::TestCase
  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_general_contact
    assert_difference('GeneralContact.count') do
      post :create, :general_contact => { :return_email => xxx@xxx.xxx :subject => 'test', :body => 'I ahve a question?'}
    end

    assert_redirected_to root_url
  end
end
