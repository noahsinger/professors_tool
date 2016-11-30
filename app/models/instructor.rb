class Instructor < ApplicationRecord
  belongs_to :division
  has_many :sections

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :division_id
  
  has_attached_file :office_hours
  validates_attachment_content_type :office_hours, content_type: ["application/pdf"]
  # do_not_validate_attachment_file_type :office_hours
  
  def to_param
    "#{id}-#{name.gsub(/\s+/i, '-')}"
  end
  
  def full_name
    "#{self.title} #{self.first_name} #{self.last_name}"
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
