class Meeting < ActiveRecord::Base
	belongs_to :section
	has_many :attendances, :dependent => :destroy

  attr_accessible :when
  
  def attendance_taken?
		self.attendances.each do |attendance|  
			unless attendance.attendance_status_id == nil
				return true	
			end
		end
		
		false
	end
end
