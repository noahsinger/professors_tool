require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  def test_create
    assert_equal 5, Section.count
  end
  
  def test_in_session
    assert_equal true, Section.find( 3 ).in_session
    assert_equal false, Section.find( 1 ).in_session
  end
  
  test "section can find the final grade for a student" do
    assert_respond_to Section.find(1), :final_grade_for
    assert_equal 1, Section.find(1).final_grade_for( Student.find(1) ) #grade returned as a percentage
  end
  
  test "section knows it's meeting days and times" do
    s = Section.find(1)
    assert_respond_to s, :meeting_days_and_times
    assert_equal s.days + ' ' + s.start_time.strftime( '%I:%M %p' ) + ' - ' + s.end_time.strftime( '%I:%M %p' ), s.meeting_days_and_times
  end
  
  test "section knows the days it happens on" do
    s = Section.find(1)
    assert_respond_to s, :days
    assert_equal "Monday Wednesday", s.days
  end
  
  test "section knows it's online" do
    s = Section.find(5)
    assert_equal "Online", s.days
  end
  
  test "section knows how many points have been assigned" do
    assert_respond_to Section.find(1), :points_assigned
    assert_equal 100, Section.find(1).points_assigned
  end
  
  test "section knows if its in the past" do
    assert_respond_to Section.find(1), :is_past
    assert_equal true, Section.find(1).is_past
    assert_equal false, Section.find(5).is_past
  end
  
  test "section knows if its in the future" do
    assert_respond_to Section.find(1), :is_future
    assert_equal true, Section.find(5).is_future
    assert_equal false, Section.find(1).is_future
  end
  
  test "sections can be emailed" do
    assert_respond_to Section.find(1), :send_email
    assert_difference('Delayed::Job.all.size', Section.find(1).enrollments.count) do
      Section.find(1).send_email( "test" )
    end
  end
  
  test "sections have a to_ical method" do
    assert_respond_to Section.find(1), :to_ical
  end
  
  test "new section will notify students waiting for that course and then destroy them" do
    section = sections(:jck1003_section_1)
    assert_respond_to section, :notify_waiters
    
    assert_equal 2, section.course.waiters.count
    
    assert_difference('Delayed::Job.all.size', section.course.waiters.count) do
      section.notify_waiters
    end
    
    assert_equal 0, section.course.waiters.count
  end
  
  test "sections report their class size" do
  	assert_respond_to Section.all.first, :class_size
  	
  	assert_equal "small", Section.all.first.class_size
  	
  	section = Section.all.first
  	section.room_number = "999"
  	7.times do
  		student = Student.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email )
  		student.save
  		e = section.enrollments.build( student_id: student.id, enrollment_status_id: EnrollmentStatus.enrolled.id )
  	end
  	section.save!
  	
  	assert_equal 9, section.enrollments.where(enrollment_status_id: EnrollmentStatus.enrolled.id ).size
  	assert_equal "medium", section.class_size
  end
  
  test "sections have days represented with numbers" do
	  section = Section.all.first
	  
	  assert_respond_to section, :wday
	  section.meeting_days = "mw"
	  assert_equal 2, section.wday.size
	  assert_equal [1,3], section.wday
	end
end
