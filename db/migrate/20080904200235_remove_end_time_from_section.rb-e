class RemoveEndTimeFromSection < ActiveRecord::Migration
  def self.up
    remove_column :sections, :end_time
  end

  def self.down
    add_column :sections, :end_time, :string
  end
end
