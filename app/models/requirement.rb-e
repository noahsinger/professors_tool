class Requirement < ActiveRecord::Base
  belongs_to :lab
  has_many :awarded_points, :dependent => :destroy
  
  attr_accessible :description, :points, :position
  
  validates_presence_of :description
  validates_presence_of :points
end
