class Objective < ApplicationRecord
  belongs_to :course

  validates_presence_of :description
end
