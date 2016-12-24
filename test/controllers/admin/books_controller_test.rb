require 'test_helper'

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  cannot_access_actions('admin/books', {course_id: 1},
                        {action: 'index'}    => :get,
                        {action: 'new'}      => :get,
                        {action: 'create'}   => :post,
                        {action: 'edit', id: 1}     => :get,
                        {action: 'update', id: 1}   => :put,
                        {action: 'destroy', id: 1}  => :delete)

  def setup
    login_as(:admin)
  end

  test "should_get_index" do
    get admin_course_books_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should_get_new" do
    get new_admin_course_book_url(courses(:intro_to_jackassery))
    assert_response :success
  end

  test "should_create_book" do
    assert_difference('Book.count') do
      post admin_course_books_url(courses(:intro_to_jackassery)),
      params: {
        book: {
          title: 'Some Book',
          author: 'Author name',
          publisher: 'Pub Name',
          isbn: '87372198738912'
        }
      }
    end

    assert_redirected_to admin_course_books_path(courses(:intro_to_jackassery))
  end

  test "should_get_edit" do
    get edit_admin_course_book_url(courses(:intro_to_jackassery),books(:one))
    assert_response :success
  end

  test "should_update_book" do
    put admin_course_book_url(courses(:intro_to_jackassery),books(:one)),
      params: {book: { title: 'new title' }}
    assert_redirected_to admin_course_books_path(courses(:intro_to_jackassery))
  end

  test "should_destroy_book" do
    assert_difference('Book.count', -1) do
      delete admin_course_book_url(courses(:intro_to_jackassery),books(:one))
    end

    assert_redirected_to admin_course_books_path(courses(:intro_to_jackassery))
  end
end
