class Attendance < ActiveRecord::Base
  belongs_to :attendance_status
  belongs_to :meeting
  belongs_to :enrollment
  # attr_accessible :title, :body
end
