class Instructor < ActiveRecord::Base
  belongs_to :division
  has_many :sections
  
  attr_accessible :title, :first_name, :last_name, :email, :twitter_handle, :office_number, :phone_number, :division_id, :office_hours, :website
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :division_id
  
  has_attached_file :office_hours
  
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
