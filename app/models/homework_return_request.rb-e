class HomeworkReturnRequest < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :enrollment
  
  attr_accessible :email, :assignment, :enrollment, :status
  
  validates_presence_of :email
  validates_format_of :email, :with => /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))$/, :message => 'must be in the form: xxx@xxx.xxx
  validates_presence_of :assignment
  validates_presence_of :enrollment, :message => 'matching that email address could not be located for this assignment'
end
