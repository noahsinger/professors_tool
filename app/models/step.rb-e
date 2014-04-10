class Step < ActiveRecord::Base
  belongs_to :how_to

  attr_accessible :image, :title, :instructions, :how_to
  
  has_attached_file :image, :styles => {:thumb => "200x200>", :normal => "800x800>", :large => "1200x1200>"}, :default_style => :normal
  
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
