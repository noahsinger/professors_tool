require 'test_helper'

class Admin::GeneralContactsControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/general_contacts', {},
                        {action: 'index'}           => :get,
                        {action: 'show', id: 1}     => :get,
                        {action: 'destroy', id: 1}  => :delete,
                        {action: 'destroy_all'}     => :delete)

  def setup
    login_as(:admin)
  end

  test "should get index" do
    get admin_general_contacts_url
    assert_response :success
  end

  test "should show general contact" do
    get admin_general_contact_url(general_contacts(:one))
    assert_response :success
  end

  test "should destroy general contact" do
    assert_difference('GeneralContact.count', -1) do
      delete admin_general_contact_url(general_contacts(:one))
    end

    assert_redirected_to admin_general_contacts_path
  end

  test "should destroy_all general contacts" do
    delete destroy_all_admin_general_contacts_url
    assert_equal 0, GeneralContact.all.size

    assert_redirected_to admin_general_contacts_path
  end
end
