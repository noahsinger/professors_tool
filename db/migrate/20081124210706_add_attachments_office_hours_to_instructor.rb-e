class AddAttachmentsOfficeHoursToInstructor < ActiveRecord::Migration
  def self.up
    remove_column :instructors, :office_hours
    add_column :instructors, :office_hours_file_name, :string
    add_column :instructors, :office_hours_content_type, :string
    add_column :instructors, :office_hours_file_size, :integer
    add_column :instructors, :office_hours_updated_at, :datetime
  end

  def self.down
    remove_column :instructors, :office_hours_file_name
    remove_column :instructors, :office_hours_content_type
    remove_column :instructors, :office_hours_file_size
    remove_column :instructors, :office_hours_updated_at
    add_column :instructor, :office_hours
  end
end
