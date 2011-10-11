class Step < ActiveRecord::Base
  belongs_to :how_to
  
  has_attached_file :image, :styles => {:thumb => "100x100>", :normal => "400x400>", :large => "800x800>"}, :default_style => :normal
  
  validates_presence_of :title
  validates_presence_of :instructions
  validates_presence_of :how_to
  
  before_create :set_position
  
  def set_position
    self.position = self.how_to.last_used_step + 1
  end
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
end
