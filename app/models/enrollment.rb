class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :section
  belongs_to :enrollment_status
  has_many :works ,:dependent => :destroy
  has_many :grade_requests, :dependent => :destroy, :order => 'created_at desc'
  has_many :homework_return_requests, :dependent => :destroy, :order => 'created_at desc'
  
  # current letter grade
  def current_grade
    letter = ''
    
    if self.current_average >= 90
      letter = 'A'
    else
      if self.current_average >= 80
        letter = 'B'
      else
        if self.current_average >= 70
          letter = 'C'
        else
          if self.current_average >= 60
            letter = 'D'
          else
            letter = 'F'
          end
        end
      end
    end
    
    letter
  end
  
  # current average as a percentage
  def current_average
    earned = self.current_points
    possible = self.section.points_assigned
    
    (earned.to_f / possible)*100
  end
  
  # current numberic points
  def current_points
    total = 0
    
    self.works.each do |work|
      if work.assignment.overdue? or work.assignment.graded?
        work.awarded_points.each do |point|
          total += point.points
        end
      end
    end
    
    total
  end
end
