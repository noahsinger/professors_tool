class Objective < ActiveRecord::Base
  belongs_to :course

  attr_accessible :description, :position
  
  validates_presence_of :description
end
