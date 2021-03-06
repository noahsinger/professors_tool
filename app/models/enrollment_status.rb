class EnrollmentStatus < ApplicationRecord
  has_many :enrollments
  validates_presence_of :name
  
  def self.method_missing( method_sym, *args, &block )
    status = where( name: method_sym.to_s ).first || where( name: method_sym.to_s.capitalize ).first
    # puts "looking for method called #{method_sym}, found status is #{status}"
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
  
#   def self.respond_to? method_sym, *args
# 		if where( name: method_sym.to_s ).first || where( name: method_sym.to_s.capitalize ).first
#       true
#     else
#       super
#     end
#   end
end
