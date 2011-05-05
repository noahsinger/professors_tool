class AddAttachmentsAttachmentToGeneralContact < ActiveRecord::Migration
  def self.up
    remove_column :general_contacts, :attachment
    add_column :general_contacts, :attachment_file_name, :string
    add_column :general_contacts, :attachment_content_type, :string
    add_column :general_contacts, :attachment_file_size, :integer
    add_column :general_contacts, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :general_contacts, :attachment_file_name
    remove_column :general_contacts, :attachment_content_type
    remove_column :general_contacts, :attachment_file_size
    remove_column :general_contacts, :attachment_updated_at
    add_column :general_contacts, :attachment, :string
  end
end
