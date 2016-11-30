class Website < ApplicationRecord
  belongs_to :course  
  validates :title, :url, presence: true
end
