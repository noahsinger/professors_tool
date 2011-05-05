class HowTo < ActiveRecord::Base
  has_many :steps, :order => 'position'
  has_many :tutorials
  has_many :courses, :through => :tutorials
  
  validates_presence_of :title
  validates_presence_of :description

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def self.search q
    how_tos = HowTo.find( :all, :include => ['steps'], :conditions => 'how_tos.title like "%' + q + '%" or how_tos.description like "%' + q + '%" or steps.title like "%' + q + '%" or steps.instructions like "%' + q + '%"' )
  end
end
