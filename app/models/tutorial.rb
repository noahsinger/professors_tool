class Tutorial < ActiveRecord::Base
  belongs_to :course
  belongs_to :how_to
  
  attr_accessible :course_id, :how_to_id
end
