class AddAttachmentsFileToMaterial < ActiveRecord::Migration
  def self.up
    remove_column :materials, :file
    add_column :materials, :file_file_name, :string
    add_column :materials, :file_content_type, :string
    add_column :materials, :file_file_size, :integer
    add_column :materials, :file_updated_at, :datetime
  end

  def self.down
    remove_column :materials, :file_file_name
    remove_column :materials, :file_content_type
    remove_column :materials, :file_file_size
    remove_column :materials, :file_updated_at
    add_column :materials, :file, :string
  end
end
