class Website < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :title, :url
  
  validates :title, :url, presence: true
end
