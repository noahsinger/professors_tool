class Course < ActiveRecord::Base
  has_many :sections, :dependent => :destroy
  has_many :labs, :dependent => :destroy
  has_many :books, :dependent => :destroy
  has_many :materials, :dependent => :destroy
  has_many :tutorials, :order => :position
  has_many :how_tos, :through => :tutorials
  has_many :objectives
  has_many :policies, :order => :position
  has_many :syllabus_parts, :through => :policies
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :discipline
  validates_presence_of :number
  validates_presence_of :credits
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
    
  def short_name
    self.discipline + self.number
  end
end
