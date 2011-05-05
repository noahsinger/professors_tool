class Division < ActiveRecord::Base
  has_many :instructors
  
  validates_presence_of :name
  validates_presence_of :phone_number
  validates_presence_of :office_number
  validates_presence_of :associate_dean
end
