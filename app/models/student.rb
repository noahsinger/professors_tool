class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :sections, through: :enrollments
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of( :email, 
                       with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
                       # on: :create, 
                       message: "has an invalid format." )

  validates_uniqueness_of :email, 
                          with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
                          message: 'address is already in use.'  

  def last_name_first
    self.last_name + ", " + self.first_name + " " + (self.middle_name || "")
  end
  
  def first_name_first
    self.first_name + " " + self.middle_name + " " + self.last_name
  end
  
  def self.search(criteria)
		Student.where("first_name like ? or last_name like ?", "%#{criteria}%", "%#{criteria}%" )
	end
end
