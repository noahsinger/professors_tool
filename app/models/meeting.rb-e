class Meeting < ActiveRecord::Base
	belongs_to :section
	has_many :attendances, :dependent => :destroy

  attr_accessible :when
end
