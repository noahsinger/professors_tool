class RemoveEnddateFromSemester < ActiveRecord::Migration
  def self.up
    remove_column :semesters, :enddate
  end

  def self.down
    add_column :semesters, :enddate, :date
  end
end
