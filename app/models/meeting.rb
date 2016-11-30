class Meeting < ApplicationRecord
	belongs_to :section
	has_many :attendances, dependent: :destroy

  def attendance_taken?
		self.attendances.each do |attendance|  
			unless attendance.attendance_status_id == nil
				return true	
			end
		end
		
		false
	end
end
