class Example < ApplicationRecord
  belongs_to :section
  
  has_attached_file :file
  do_not_validate_attachment_file_type :file
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :file
end
