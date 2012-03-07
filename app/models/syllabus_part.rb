class SyllabusPart < ActiveRecord::Base
  has_many :policies
  has_many :courses, :through => :policies
  
  attr_accessible :name, :title, :description
  
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :description
end
