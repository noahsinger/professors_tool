class EnrollmentStatus < ActiveRecord::Base
  has_many :enrollments
  
  attr_accessible :name
  
  validates_presence_of :name
end
