class AwardedPoint < ActiveRecord::Base
  belongs_to :work
  belongs_to :requirement
  
  attr_accessible :work, :requirement, :points
end
