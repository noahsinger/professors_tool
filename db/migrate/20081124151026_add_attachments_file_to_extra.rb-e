class AddAttachmentsFileToExtra < ActiveRecord::Migration
  def self.up
    remove_column :extras, :file
    add_column :extras, :file_file_name, :string
    add_column :extras, :file_content_type, :string
    add_column :extras, :file_file_size, :integer
    add_column :extras, :file_updated_at, :datetime
  end

  def self.down
    remove_column :extras, :file_file_name
    remove_column :extras, :file_content_type
    remove_column :extras, :file_file_size
    remove_column :extras, :file_updated_at
    add_column :extras, :file, :string
  end
end
