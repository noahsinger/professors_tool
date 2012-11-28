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
  
  def short_days
  	if self.meeting_days.downcase =~ /all/
  		"online"
  	else
	  	self.meeting_days.gsub( ' ', '' )
	  end
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
  
  def sync_students_with_ted
    agent = Mechanize.new do |a|
    	# needed in 1.9, causes error in 1.8
	    # a.ssl_version='SSLv3'
    end

    agent.follow_meta_refresh = true

    #login to ted
    page = agent.get( "https://banweb.tulsacc.edu/PROD/twbkwbis.P_WWWLogin" )
    form = page.form_with(:name => 'loginform')
    form.field_with(:name => 'sid').value = APP_CONFIG['ted_username']
    form.field_with(:name => 'PIN').value = APP_CONFIG['ted_password']
    
    result = agent.submit(form)

    #nav to detailed schedule
    result = result.links_with( :text => 'Faculty and Advisors' ).first.click
    result = result.links_with( :text => 'Faculty Detail Schedule' ).first.click
    form = result.forms.last
    select = form.field_with(:name => 'term' )
    puts "Updating #{self.semester.name}"
    select.value = select.options.find {|option| option.text =~ %r{#{self.semester.name_for_ted}}}
    result = agent.submit(form)

    #parse the data page
    p = Nokogiri::HTML(result.body)
    tables = p.css("table.datadisplaytable")
    
    #mark all students as dropped
    self.enrollments.all.each do |enrollment|
      enrollment.update_attributes( :enrollment_status_id => EnrollmentStatus.dropped.id )
    end
    
    count = 0

    # tables on the semester detail page, tables contain each section for the semester (3 per section)
    tables.each do |table|
      case
        when count % 3 == 0
          #it's the title table
          title_link = table.css("a").first.text
          title, callno, courseno, secno = title_link.split( " - " )
          
          puts " - Updating #{title}"
          
          if callno == self.call_number
            # navigate to the student detail page (first Classlist page)
            class_list_link = table.css( "a" ).find {|a| a.text == 'Classlist'}
            result = agent.get( class_list_link['href'] )
            page = Nokogiri::HTML(result.body)
            
            parse_student_tables_on_page( page )
            
            # what if there are additional pages of students???
            page_number = 2 # start with page 2 because page 1 (current page) was done above
            loop do
              if link = page.css( "a" ).find {|a| a.text == "#{page_number}1 - #{page_number+1}0"}
                # puts "Found page #{page_number} of students for #{title}"
                result = agent.get( link['href'] )
                page = Nokogiri::HTML(result.body)
                
                # repeat for each page of students
                parse_student_tables_on_page( page )
                
                page_number += 1
              else
                # puts "No additional pages of students found for #{title}"
                break
              end
            end
            
          end # end callno == self.call_number
      
        when count % 3 == 1
          #it's the enrollments table, do nothing
      
        when count % 3 == 2
          #it's the meeting times table, do nothing
          
        else
          puts "Found a table that shouldn't be here while syncing students"
      end
  
      count += 1
    end #done with tables
  end #end import method
  
  
  private 
  
  def parse_student_tables_on_page( page )
    # retreive all tables on the student detail page (Classlist page)
    tables = page.css("table.datadisplaytable")
            
    # table 2 is the table containing the student list
    tables[2].css("tr").each do |row|
      links = row.css("td.dddefault span.fieldmediumtext a")
      if links.size > 0 #so we don't try the header row
        # print "name: #{links[0].text}, "
        # print "status: #{links[1].text}, "
        # print "email: #{links[2]['href'].split(':')[1]}"
                
        # current student information links (should be three)
        current_students_full_name = "#{links[0].text}"
        current_students_status = "#{links[1].text}"
        # link 3 is a mailto: link, ditch the mailto: in element 0, keep the address in element 1
        current_students_email = "#{links[2]['href'].split(':')[1]}"
                
        # puts 
                
        current_enrollment = find_or_create_student_enrollment( current_students_email, current_students_full_name )
                
        #if status is 'Enter' mark them as enrolled
        # puts "marking #{current_students_full_name} enrollment status based on #{current_students_status}"
        if current_students_status == "Enter"
          current_enrollment.update_attributes( :enrollment_status_id => EnrollmentStatus.enrolled.id )
        elsif current_students_status == "W"
          current.enrollment.update_attributes( :enrollment_status_id => EnrollmentStatus.withdrawn.id )
        elsif current_students_status == "AU"
          current.enrollment.update_attributes( :enrollment_status_id => EnrollmentStatus.audit.id )
        end
      end # end if there are links
    end # end processing rows
  end
  
  def find_or_create_student_enrollment( email, name )
    #get students enrollment if they are already enrolled in this section
    current_enrollment = self.enrollments.all.find do |enrollment|
      enrollment.student.email == email
    end
                
    #  if they are not already enrolled in this section
    unless current_enrollment
      # puts "#{name} not enrolled"
                  
      # see if the student exist at all
      existing_student = Student.find_by_email( email )
                  
      # if the student doesn't exist, create them
      unless existing_student
        # puts "creating new student #{name}"
        last, first, mi = name.split( ' ' )
        mi = mi || '' # mi may not exist
        existing_student = Student.create!( :first_name => first, :last_name => last.delete(','), :middle_name => mi.delete('.'), :email => email )
      end
                  
      # puts "enrolling #{name}"
      current_enrollment = self.enrollments.build( :student_id => existing_student.id, :enrollment_status_id => EnrollmentStatus.dropped.id )
    end
    
    current_enrollment
  end #end find_or_create...
end
