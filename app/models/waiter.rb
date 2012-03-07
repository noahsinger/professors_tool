class Waiter < ActiveRecord::Base
  belongs_to :course

  attr_accessible :email
  
  validates :email, :presence => true, :format => {:with => xxx@xxx.xxx
  validates :email, :uniqueness => {:scope => :course_id, :message => 'address is already waiting for this course'}
end
