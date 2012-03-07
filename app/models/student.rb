class Student < ActiveRecord::Base
  has_many :enrollments, :dependent => :destroy
  has_many :sections, :through => :enrollments
  
  attr_accessible :first_name, :last_name, :email
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of( :email, 
                       :with => xxx@xxx.xxx 
                       :on => :create, 
                       :message=>"has an invalid format.")

  validates_uniqueness_of :email, 
                          :with => xxx@xxx.xxx 
                          :message => 'address is already in use.'  

  def last_name_first
    self.last_name + ", " + self.first_name + " " + self.middle_name
  end
  
  def first_name_first
    self.first_name + " " + self.middle_name + " " + self.last_name
  end
end
