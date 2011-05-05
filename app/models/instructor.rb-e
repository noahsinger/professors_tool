class Instructor < ActiveRecord::Base
  belongs_to :division
  has_many :sections
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :division_id
  
  has_attached_file :office_hours
  
  def full_name
    "#{self.title} #{self.first_name} #{self.last_name}"
  end
end
