class AddEmailToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :email, :string
  end

  def self.down
    remove_column :works, :email
  end
end
