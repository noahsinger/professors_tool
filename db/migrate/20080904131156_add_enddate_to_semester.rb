class AddEnddateToSemester < ActiveRecord::Migration
  def self.up
    add_column :semesters, :enddate, :date
  end

  def self.down
    remove_column :semesters, :enddate
  end
end
