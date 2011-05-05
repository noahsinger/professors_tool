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
    self.meeting_days + ' ' + self.start_time.strftime( '%I:%M %p' ) + ' - ' + self.end_time.strftime( '%I:%M %p' )
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

  def send_email body
    self.enrollments.each do |e|
      email = Mailer::create_section_email( self, e.student.email, body )
      # Mailer.deliver( email )
      Mailer.send_later :deliver, email
      logger.info("[section email] email sent to #{e.student.email}")
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
