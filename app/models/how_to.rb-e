class HowTo < ActiveRecord::Base
  has_many :steps, :order => 'position'
  has_many :tutorials
  has_many :courses, :through => :tutorials
  
  validates_presence_of :title
  validates_presence_of :description

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
