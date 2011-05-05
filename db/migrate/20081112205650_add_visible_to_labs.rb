class AddVisibleToLabs < ActiveRecord::Migration
  def self.up
    add_column :labs, :visible, :boolean
  end

  def self.down
    remove_column :labs, :visible
  end
end
