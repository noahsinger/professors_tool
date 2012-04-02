require 'icalendar'
require 'date'

class Section < ActiveRecord::Base
  belongs_to :semester
  belongs_to :course
  belongs_to :instructor
  has_many :assignments, :dependent => :destroy, :order => 'duedate desc'
  has_many :enrollments, :dependent => :destroy
  has_many :students, :through => :enrollments
  has_many :grade_requests, :dependent => :destroy, :order => 'created_at desc'
  has_many :examples, :dependent => :destroy, :order => 'created_at desc'
  has_many :enrollment_snapshots, :dependent => :destroy
  
  attr_accessible :course_id, :call_number, :section_number, :meeting_days, :room_number, :start_date, :end_date, :instructor_id, :start_time, :end_time
  
  validates_presence_of :course
  validates_presence_of :call_number
  validates_presence_of :section_number
  validates_presence_of :meeting_days
  validates_presence_of :room_number
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :instructor

  def to_param
    "#{id}-#{course.title.gsub(/[^a-z0-9]+/i, '-')}"
  end

  def final_grade_for student
    enrollment = self.enrollments.find_by_student_id( student.id )
    earned = enrollment.works.inject( 0 ) {|total,w| total += w.score}
    if earned == 0
      0
    else
      earned.to_f / self.points_assigned
    end
  end

  def meeting_days_and_times
    if self.days == "Online" or self.days == "Online Course"
      self.days
    else
      self.days + ' ' + self.start_time.strftime( '%I:%M %p' ) + ' - ' + self.end_time.strftime( '%I:%M %p' )
    end
  end
  
  def days
    days = []
    days << "Monday" if self.meeting_days.downcase =~ /m/
    days << "Tuesday" if self.meeting_days.downcase =~ /t/
    days << "Wednesday" if self.meeting_days.downcase =~ /w/
    days << "Thursday" if self.meeting_days.downcase =~ /r/
    days << "Friday" if self.meeting_days.downcase =~ /f/
    days << "Online" if self.meeting_days.downcase =~ /all/
    
    days.join( " " )
  end
  
  def points_assigned
    total = 0
    
    self.assignments.each do |assignment|
      if assignment.overdue? or assignment.graded?
        total += assignment.worth
      end
    end
    
    total
  end
    
  def in_session
    if self.start_date <= Time.now.to_date and self.end_date >= Time.now.to_date
      true
    else
      false
    end
  end
  
  def is_past
    if self.end_date < Time.now.to_date
      true
    else
      false
    end
  end
  
  def is_future
    if self.start_date > Time.now.to_date
      true
    else
      false
    end
  end
  
  def notify_waiters
    self.course.waiters.all.each do |waiter|
      StudentMailer.delay.section_availability_notification(self, waiter.email)
      waiter.destroy
    end
  end

  def send_email body
    self.enrollments.each do |e|
      StudentMailer.delay.section_email( self, e.student.email, body )
    end
  end
  
  def to_ical
    cal = Icalendar::Calendar.new

    # to appease Outlook
    cal.custom_property("METHOD","PUBLISH")
    
    cal.product_id = "-//dclicio.us//iCal 1.0//EN"
    cal.custom_property("X-WR-CALNAME;VALUE=TEXT", self.course.title + " " + self.semester.name)
    cal.custom_property("X-WR-TIMEZONE;VALUE=TEXT", "US/Central")
    
    self.assignments.each do |assignment|
      event = assignment.to_ical_event
    	cal.add_event(event)
    end

    cal.to_ical
  end
end
