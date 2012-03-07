class Division < ActiveRecord::Base
  has_many :instructors

  attr_accessible :name, :phone_number, :office_number, :associate_dean
  
  validates_presence_of :name
  validates_presence_of :phone_number
  validates_presence_of :office_number
  validates_presence_of :associate_dean
end
