class Lab < ApplicationRecord
  belongs_to :course
  has_many :requirements, -> {order :position}, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :extras, dependent: :destroy
  
  validates_presence_of :title
  validates_presence_of :objective
  validates_presence_of :instructions
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def worth
    worth = 0
    self.requirements.each do |r|
      worth += r.points
    end
    
    worth
  end
end
