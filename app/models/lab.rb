class Lab < ActiveRecord::Base
  belongs_to :course
  has_many :requirements, :dependent => :destroy, order: :position
  has_many :assignments, :dependent => :destroy
  has_many :extras, :dependent => :destroy
  
  attr_accessible :title, :objective, :instructions, :visible, :allow_uploads
  
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
