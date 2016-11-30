class HowTo < ApplicationRecord
  has_many :steps, -> {order 'position'}
  has_many :tutorials
  has_many :courses, :through => :tutorials
  
  validates_presence_of :title
  validates_presence_of :description

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def last_used_step
    last_step = steps.order(:position).last
    if last_step and not last_step.position.nil?
      last_step.position
    else
      0
    end
  end
end
