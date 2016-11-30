class Policy < ApplicationRecord
  belongs_to :syllabus_part
  belongs_to :course
  
  validates_presence_of :course_id
  validates_presence_of :syllabus_part_id
end
