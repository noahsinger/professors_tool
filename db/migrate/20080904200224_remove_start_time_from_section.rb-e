class RemoveStartTimeFromSection < ActiveRecord::Migration
  def self.up
    remove_column :sections, :start_time
  end

  def self.down
    add_column :sections, :start_time, :string
  end
end
