class Semester < ApplicationRecord
  has_many :sections, dependent: :destroy

  validates_presence_of :year
  validates_presence_of :season

  def to_param
    "#{id}-#{short_name.gsub(/[^a-z0-9]+/i, '-')}"
  end

  def self.current
    @semesters = Semester.order('start_date')
    @semesters.each do |s|
      if s.start_date <= Time.now.to_date and s.end_date >= Time.now.to_date
        return s
      end
    end

    nil
  end

  def self.future
    Semester.order('start_date').select do |semester|
      semester.start_date > Time.now.to_date
    end
  end

  def student_count
    self.sections.inject( 0 ) {|total, section| total += section.enrollments.size}
  end

  def is_current?
		self == Semester.current
	end

  def is_past
    if self.end_date < Time.now.to_date
      true
    else
      false
    end
  end

  def is_future?
    self.is_future
  end

  def is_future
    if self.start_date > Time.now.to_date
      true
    else
      false
    end
  end

  def name
    self.season + " " + self.year.to_s
  end

  def name_for_ted
  	if self.season == "Fall"
  		"#{self.season} #{self.year - 1}"
  	else
  		self.name
  	end
  end

  def short_name
    self.season + self.year.to_s
  end

  def numeric
		output = ""
		if self.season == "Fall"
			output = "1"
		elsif self.season == "Spring"
			output = "2"
		elsif self.season == "Summer"
			output = "3"
		end

		output << self.year.to_s[2,4]
	end

  def import_sections_from_ted
    agent = Mechanize.new do |a|
    	# needed in 1.9, causes error in 1.8
	    # a.ssl_version='SSLv3'
    end

    agent.verify_mode= OpenSSL::SSL::VERIFY_NONE # TED is missing intermediate certificates so it has to be ignored to work
    agent.follow_meta_refresh = true

    #login to ted directly
    # page = agent.get( "https://banweb.tulsacc.edu/PROD/twbkwbis.P_WWWLogin" )
    # form = page.form_with(:name => 'loginform')
    # form.field_with(:name => 'sid').value = APP_CONFIG['ted_username']
    # form.field_with(:name => 'PIN').value = APP_CONFIG['ted_password']
    #
    # result = agent.submit(form)

    #login to ted through mytcc
    page = agent.get( "https://lp5prod-cas.tulsacc.edu/cas/login?service=https%3A%2F%2Fmytcc.tulsacc.edu%2Fc%2Fportal%2Flogin" )
    form = page.form_with(id: 'fm1')
    form.field_with(name: 'username').value = APP_CONFIG['ted_username']
    form.field_with(name: 'password').value = APP_CONFIG['ted_password']

    result = agent.submit(form)

    # nav to ted through mytcc
    result = result.links_with( text: ' Faculty ' ).first.click
    result = result.links_with( text: 'Faculty Detail Class List' ).first.click

    #nav to detailed schedule
    result = result.links_with( text: 'Faculty and Advisors' ).first.click
    result = result.links_with( text: 'Faculty Detail Schedule' ).first.click
    form = result.forms.last
    select = form.field_with(name: 'term')
    puts "Updating #{self.name}"
    select.value = select.options.find {|option| option.text =~ %r{#{self.name_for_ted}}}
    result = agent.submit(form)

    #parse the data page
    p = Nokogiri::HTML(result.body)
    tables = p.css("table.datadisplaytable")

    count = 0
    title = callno = courseno = secno = time_range = days = room = date_range = instructor_name = current_enrollment = ""
    teds_sections = []

    tables.each do |table|
      case
        when count % 3 == 0
          #it's the title table
          title_link = table.css("a").first.text
          title, callno, courseno, secno = title_link.split( " - " )

        when count % 3 == 1
          #it's the enrollments table
          # table.css("td")[0].text #max enrollment
          current_enrollment = table.css("td")[1].text #current enrollment

        when count % 3 == 2
          #it's the meeting times table
          time_range = table.css("td")[1].text
          days = table.css("td")[2].text
          room = table.css("td")[3].text
          date_range = table.css("td")[4].text
          # instructor_name = table.css("td")[6].text # has to be me because I used my login info for ted

          ##
          # once we've reached this point in the third table we've read all of the data about the section so it's time to create

          discipline, number = courseno.split(" ")
          course = Course.find_by_discipline_and_number(discipline,number)

          start_time = end_time = Time.parse("12:00 am")
          unless time_range == "TBA"
            start_time_string, end_time_string = time_range.split( " - " )
            start_time = Time.zone.parse(start_time_string)
            end_time = Time.zone.parse(end_time_string)
          end

          days = "Online" if days.blank?

          start_date_string, end_date_string = date_range.split( " - " )
#           start_date = Date.parse(start_date_string)
          start_date = DateTime.parse(start_date_string).in_time_zone
#           end_date = Date.parse(end_date_string)
          end_date = DateTime.parse(end_date_string).in_time_zone
          instructor = Instructor.find_by_last_name "Singer"

          # puts "title: #{title}"
          # puts "call number: #{callno}"
          # puts "course number: #{course.discipline}#{course.number} #{course.title}"
          # puts "section number: #{secno}"
          # puts "current enrollment: #{current_enrollment}"
          # puts "time range: #{start_time} - #{end_time}"
          # puts "days: \"#{days}\""
          # puts "room: #{room}"
          # puts "date range: #{start_date} - #{end_date}"
          # puts "instructor name: #{instructor_name}"
          # puts "instructor: #{instructor.id}"

          if course
            if instructor
              teds_sections << [self.sections.build( course_id: course.id, call_number: callno, section_number: secno, meeting_days: days, start_date: start_date, end_date: end_date, start_time: start_time, end_time: end_time, room_number: room, instructor_id: instructor.id ), current_enrollment]
            else
              puts "There is no instructor to add for this section"
            end
          else
            puts "The course (#{title}) needed to add a section (#{callno}) was missing"
          end
        else
          puts "Found a table that shouldn't be here while syncing semester"
      end

      count += 1
    end #done with tables

    ##
    # all sections for this semester have been gathered from ted and are in the teds_sections array
    teds_sections.each do |section, enrollment|
      ##
      #if section doesn't already exist, add it
      unless self.sections.find_by_call_number(section.call_number)
        section.save
        # add enrollments snapshot
        section.enrollment_snapshots.create!(enrollment_count: enrollment)
      else
        # add enrollments snapshot
        self.sections.find_by_call_number(section.call_number).enrollment_snapshots.create!(enrollment_count: enrollment)
      end
    end

  end #end import method

end #end class
