require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  fixtures :semesters
  
  def test_create
    assert_equal 3, Semester.count
  end
  
  def test_name
    assert_equal semesters(:fall).season + " " + semesters(:fall).year.to_s, Semester.find( 1 ).name
  end

  def test_short_name
    assert_equal semesters(:fall).season + semesters(:fall).year.to_s, Semester.find( 1 ).short_name
  end
  
  def test_is_past
    assert_equal true, Semester.find( 1 ).is_past
  end
  
  def text_current
    assert_equal 2, Semester.current.id
  end
  
  def test_is_future
    assert_equal true, Semester.find( 3 ).is_future
  end
  
  def test_invalid
    semester = Semester.new :start_date => 1.month.ago, :end_date => 2.months.from_now
    semester.valid?
    assert_equal 2, semester.errors.size
  end

  test "Semester class should be able to find the current semester" do
    assert_respond_to Semester, :current
    assert_equal semesters(:spring), Semester.current
  end
  
  test "Semester should be able to count the number of enrolled students" do
    assert_respond_to Semester.first, :student_count
    assert_equal 2, semesters(:spring).student_count
  end
end
