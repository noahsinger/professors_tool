class Policy < ActiveRecord::Base
  belongs_to :syllabus_part
  belongs_to :course
  
  attr_accessible :course_id, :syllabus_part_id
  
  validates_presence_of :course_id
  validates_presence_of :syllabus_part_id
end
