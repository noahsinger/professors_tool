require 'test_helper'

class GeneralContactsControllerTest < ActionDispatch::IntegrationTest
  test "should_get_new" do
    get new_general_contact_url
    assert_response :success
  end

  test "should_create_general_contact" do
    assert_difference('GeneralContact.count') do
      post general_contacts_url,
        params: {
          general_contact: {
            return_email: xxx@xxx.xxx
            subject: 'test',
            body: 'I ahve a question?'
          }
        }
    end

    assert_redirected_to root_url
  end
end
