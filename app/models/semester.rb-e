class Semester < ActiveRecord::Base
  has_many :sections, :dependent => :destroy
  
  validates_presence_of :year
  validates_presence_of :season
  
  def to_param
    "#{id}-#{short_name.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def self.current
   xxx@xxx.xxx = Semester.find( :all, :order => 'start_date' )
   xxx@xxx.xxx do |s|
      if s.start_date < Time.now.to_date and s.end_date > Time.now.to_date
        return s
      end
    end
    
    return Semester.find( :last )
  end

  def student_count
    self.sections.inject( 0 ) {|total, section| total += section.enrollments.size}
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

  def name
    self.season + " " + self.year.to_s
  end

  def short_name
    self.season + self.year.to_s
  end

end
