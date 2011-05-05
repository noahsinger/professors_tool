require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  fixtures :semesters
  
  def test_create
    assert_equal Semester.count, 3
  end
  
  def test_name
    assert_equal Semester.find( 1 ).name, semesters(:fall).season + " " + semesters(:fall).year.to_s
  end

  def test_short_name
    assert_equal Semester.find( 1 ).short_name, semesters(:fall).season + semesters(:fall).year.to_s
  end
  
  def test_is_past
    assert_equal Semester.find( 1 ).is_past, true
  end
  
  def text_current
    assert_equal Semester.current.id, 2
  end
  
  def test_is_future
    assert_equal Semester.find( 3 ).is_future, true
  end
  
  def test_invalid
    semester = Semester.new :start_date => 1.month.ago, :end_date => 2.months.from_now
    semester.valid?
    assert_equal semester.errors.size, 2
  end
end
