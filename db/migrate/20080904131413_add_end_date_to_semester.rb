class AddEndDateToSemester < ActiveRecord::Migration
  def self.up
    add_column :semesters, :end_date, :date
  end

  def self.down
    remove_column :semesters, :end_date
  end
end
