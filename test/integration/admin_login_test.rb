require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  fixtures :all

  def setup
    User.create(:username => 'user', :password => 'test', :password_confirmation => 'test')
    
    visit login_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'test')
    click_on("Sign in")
    
    click_on( "Signout" )
  end

  test "user can login" do
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal login_path, current_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'test')
    click_on("Sign in")
    
    #successful login redirects to original destination
    assert_equal admin_admin_path, current_path
  end
  
  test "user cannot login with bad password" do
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal login_path, current_path
    
    fill_in("Username", :with => 'user')
    fill_in("Password", :with => 'bad')
    click_on("Sign in")
    
    #unsuccessful login redirects to signin page
    assert_equal sessions_path, current_path
  end
  
  test "user cannot login with bad username" do
    visit admin_semesters_path
    
    #redirected to signin page
    assert_equal login_path, current_path
    
    fill_in("Username", :with => 'bad')
    fill_in("Password", :with => 'test')
    click_on("Sign in")
    
    #unsuccessful login redirects to signin page
    assert_equal sessions_path, current_path
  end
end
