class Example < ActiveRecord::Base
  belongs_to :section
  
  has_attached_file :file
  
  attr_accessible :name, :description, :file
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :file
end
