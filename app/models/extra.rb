class Extra < ApplicationRecord
  belongs_to :lab
  
  has_attached_file :file

  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
  
  validates_presence_of :file
  validates_presence_of :description
end
