class Meeting < ActiveRecord::Base
	belongs_to :section

  attr_accessible :when
end
