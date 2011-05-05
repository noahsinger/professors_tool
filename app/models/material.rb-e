class Material < ActiveRecord::Base
  belongs_to :course
  
  has_attached_file :file
  
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :file
end
