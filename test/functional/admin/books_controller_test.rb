require 'test_helper'

class Admin::BooksControllerTest < ActionController::TestCase
  cannot_access_actions({:new => :get, :create => :post, :edit => :get, :update => :post, :destroy => :delete})
  
  def setup
    login_as(:admin)
  end
  	
  def test_should_get_new
    get :new, :course_id => courses(:intro_to_jackassery).id
    assert_response :success
  end
  
  def test_should_create_book
    assert_difference('Book.count') do
      post :create, :course_id => courses(:intro_to_jackassery).id,
      :book => { 
        :title => 'Some Book',
        :author => 'Author name',
        :publisher => 'Pub Name',
        :isbn => '87372198738912'
      }
    end
  
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
  
  def test_should_show_book
    get :show, :course_id => courses(:intro_to_jackassery).id, :id => books(:one).id
    assert_response :success
  end
  
  def test_should_get_edit
    get :edit, :course_id => courses(:intro_to_jackassery).id, :id => books(:one).id
    assert_response :success
  end
  
  def test_should_update_book
    post :update, :course_id => courses(:intro_to_jackassery).id, :id => books(:one).id, :book => { :title => 'new title' }
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
  
  def test_should_destroy_book
    assert_difference('Book.count', -1) do
      delete :destroy, :course_id => courses(:intro_to_jackassery).id, :id => books(:one).id
    end
  
    assert_redirected_to admin_course_path(courses(:intro_to_jackassery))
  end
end
