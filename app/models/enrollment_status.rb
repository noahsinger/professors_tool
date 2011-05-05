class EnrollmentStatus < ActiveRecord::Base
  has_many :enrollments
  
  validates_presence_of :name
end
