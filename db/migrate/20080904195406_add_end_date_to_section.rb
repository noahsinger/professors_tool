class AddEndDateToSection < ActiveRecord::Migration
  def self.up
    add_column :sections, :end_date, :date
  end

  def self.down
    remove_column :sections, :end_date
  end
end
