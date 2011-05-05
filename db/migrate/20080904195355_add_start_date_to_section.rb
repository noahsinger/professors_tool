class AddStartDateToSection < ActiveRecord::Migration
  def self.up
    add_column :sections, :start_date, :date
  end

  def self.down
    remove_column :sections, :start_date
  end
end
