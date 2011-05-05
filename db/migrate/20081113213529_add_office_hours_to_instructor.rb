class AddOfficeHoursToInstructor < ActiveRecord::Migration
  def self.up
    add_column :instructors, :office_hours, :string
  end

  def self.down
    remove_column :instructors, :office_hours
  end
end
