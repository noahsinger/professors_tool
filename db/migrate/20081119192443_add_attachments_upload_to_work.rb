class AddAttachmentsUploadToWork < ActiveRecord::Migration
  def self.up
    remove_column :works, :upload
    add_column :works, :upload_file_name, :string
    add_column :works, :upload_content_type, :string
    add_column :works, :upload_file_size, :integer
    add_column :works, :upload_updated_at, :datetime
  end

  def self.down
    remove_column :works, :upload_file_name
    remove_column :works, :upload_content_type
    remove_column :works, :upload_file_size
    remove_column :works, :upload_updated_at
    add_column :works, :upload, :string
  end
end
