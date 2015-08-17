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
  
  def test_current
    assert_equal 2, Semester.current.id #id is 2 so spring is current semester
  end
  
  test "what if today is the first day of the semester" do
		Semester.current.destroy
		semester = Semester.new :year => '1999', :season => 'Fall', :start_date => Time.now, :end_date => 4.months.from_now
		semester.save

		assert_equal semester, Semester.current
	end
  
  test "what if there isn't a current semester" do
		Semester.current.destroy
		assert_nil Semester.current  
	end
	
	test "can get a list of future semesters" do
		assert_equal 1, Semester.future.size
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
  
  test "Fall semesters should report previous year for ted" do
  	assert_respond_to Semester.first, :name_for_ted
  	assert_equal "Fall 2008", Semester.first.name_for_ted
  end
  
end
