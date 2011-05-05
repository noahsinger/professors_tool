class Tutorial < ActiveRecord::Base
  belongs_to :course
  belongs_to :how_to
end
