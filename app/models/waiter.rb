class Waiter < ApplicationRecord
  belongs_to :course

  validates :email, :presence => true, :format => {:with => /\A[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))\z/i}
  validates :email, :uniqueness => {:scope => :course_id, :message => 'address is already waiting for this course'}
end
