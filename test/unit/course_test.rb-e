require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def test_create
    assert_equal 2, Course.count
  end
  
  def test_short_name
    assert_equal courses(:intro_to_jackassery).discipline + courses(:intro_to_jackassery).number, Course.find( 1 ).short_name
  end
  
  def test_invalid
    course = Course.new
    course.valid?
    assert_equal course.errors.size, 5
  end
end
