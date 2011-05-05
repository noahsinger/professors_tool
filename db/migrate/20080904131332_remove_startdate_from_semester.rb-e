class RemoveStartdateFromSemester < ActiveRecord::Migration
  def self.up
    remove_column :semesters, :startdate
  end

  def self.down
    add_column :semesters, :startdate, :date
  end
end
