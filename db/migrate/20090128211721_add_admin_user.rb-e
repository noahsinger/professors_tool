class AddAdminUser < ActiveRecord::Migration
  def self.up
    admin = User.new( :username => 'admin', :password => 'test' )
    admin.save
  end

  def self.down
    admin = User.find_by_username( 'admin' )
    if admin
      admin.destroy
    end
  end
end
