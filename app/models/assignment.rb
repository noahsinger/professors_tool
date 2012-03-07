require 'shortly'

class Assignment < ActiveRecord::Base
  include Rails.application.routes.url_helpers # to allow the use of named routes in this model (:host attribute required for urls)
  
  attr_accessible :title, :lab, :duedate, :lab_id
  
  belongs_to :lab
  belongs_to :section
  has_many :works, :dependent => :destroy
  has_many :homework_return_requests, :dependent => :destroy, :order => 'created_at desc'
  
  validates_presence_of :title
  validates_presence_of :lab
  
  after_create :generate_short_url

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def generate_short_url
    googl = Shortly::Clients::Googl    
    update_attribute :short_url, googl.shorten(semester_section_assignment_url(self.section.semester,self.section,self,:host => "ingenio.us.com")).shortUrl
  end
  
  def worth
    worth = 0
    self.lab.requirements.each do |r|
      worth += r.points
    end
    
    worth
  end
  
  def average
    total = 0
    self.works.each do |work|
      total += work.score if work and work.score
    end
    
    if self.works.size > 0
      total / self.works.size
    else
      0
    end
  end
  
  def overdue?
    if self.duedate < Time.now
      true
    else
      false
    end
  end
  
  def graded?
    graded = true

    self.works.each do |work|
      if work.awarded_points.size != self.lab.requirements.size
        graded = false
      end
    end
    
    if self.works.size == 0
      graded = false
    end
    
    graded
  end
  
  def self.visible
   xxx@xxx.xxx = Assignment.find(:all, :joins => [:lab], :conditions => ["labs.visible = ?", true], :order => 'duedate desc')
  end
  
  def to_ical_event
    event = Icalendar::Event.new
  	event.klass       "PUBLIC"
  	event.custom_property( "DTSTART;VALUE=DATE", self.duedate.strftime("%Y%m%d").to_i )
    # event.dtstart     DateTime.civil(self.duedate.strftime("%Y").to_i, self.duedate.strftime("%m").to_i, self.duedate.strftime("%d").to_i, self.duedate.strftime("%H").to_i, self.duedate.strftime("%M").to_i)
    # event.dtend       DateTime.civil(self.duedate.strftime("%Y").to_i, self.duedate.strftime("%m").to_i, (self.duedate.strftime("%d").to_i)+1, self.duedate.strftime("%H").to_i, self.duedate.strftime("%M").to_i)
  	event.summary     self.section.course.title + " " + self.title + " due by " + self.duedate.strftime( "%I:%M %p" )
  	event.description self.section.course.title + " " + self.title + " :: " + self.lab.title + " is due by " + self.duedate.strftime( "%I:%M %p" )
  	event.location    ""
  	event.dtstamp     self.created_at.to_datetime
    event.url         "http://www.ingenio.us.com/semesters/" + self.section.semester.id.to_s + "/sections/" + self.section.id.to_s + "/assignments/" + self.id.to_s
  	event.uid         self.section.call_number + "-assignment-#{self.id.to_s}"
  	event.sequence    0
  	
  	event
  end  
end
