class AddAttachmentsFileToExample < ActiveRecord::Migration
  def self.up
    add_column :examples, :file_file_name, :string
    add_column :examples, :file_content_type, :string
    add_column :examples, :file_file_size, :integer
    add_column :examples, :file_updated_at, :datetime
  end

  def self.down
    remove_column :examples, :file_file_name
    remove_column :examples, :file_content_type
    remove_column :examples, :file_file_size
    remove_column :examples, :file_updated_at
  end
end
