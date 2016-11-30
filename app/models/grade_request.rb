class GradeRequest < ApplicationRecord
  belongs_to :section
  belongs_to :enrollment
  
  validates_presence_of :email
  validates_presence_of :section
  
  validates_format_of :email, :with => /\A[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))\z/, :message => 'must be in the form: xxx@xxx.xxx
  
  def send_email
    StudentMailer.grade_request( self.enrollment ).deliver_later
  end
end
