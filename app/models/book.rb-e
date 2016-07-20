class Book < ActiveRecord::Base
  belongs_to :course

  attr_accessible :title, :author, :isbn, :publisher, :required
  
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :isbn
  validates_presence_of :publisher
end
