require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "user can login" do
    visit signout_admin_admin_index_path
    
    User.create(:username => 'user', :password => 'test')
    
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal signin_admin_admin_index_path, current_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'test')
    click_on("Sign in")
    
    #successful login redirects to original destination
    assert_equal admin_semesters_path, current_path
  end
  
  test "user cannot login with bad password" do
    User.create(:username => 'user', :password => 'test')
    
    visit signout_admin_admin_index_path
    
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal signin_admin_admin_index_path, current_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'bad')
    click_on("Sign in")
    
    #unsuccessful login redirects to signin page
    assert_equal signin_admin_admin_index_path, current_path
  end
  
  test "user cannot login with bad username" do
    User.create(:username => 'user', :password => 'test')
    
    visit signout_admin_admin_index_path
    
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal signin_admin_admin_index_path, current_path
    
    fill_in("Username", :with => 'bad')
    fill_in("Password", :with => 'test')
    click_on("Sign in")
    
    #unsuccessful login redirects to signin page
    assert_equal signin_admin_admin_index_path, current_path
  end
end
