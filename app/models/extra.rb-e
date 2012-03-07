class Extra < ActiveRecord::Base
  belongs_to :lab
  
  has_attached_file :file

  attr_accessible :file, :description
  
  validates_attachment_presence :file
  
  validates_presence_of :file
  validates_presence_of :description
end
