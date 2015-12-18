class AttendanceStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :attendances
  validates_presence_of :name
  
  def self.method_missing( method_sym, *args, &block )
    status = where( :name => method_sym.to_s ).first || where( :name => method_sym.to_s.capitalize ).first
    if status
      # create a class method for this status so that it will be there next time it's called
      self.send( :define_method, status.name.downcase ) do
        status
      end
      
      # return the status for this call, which won't be needed next time since the class method now exists
      status
    else
      super
    end
  end
end
