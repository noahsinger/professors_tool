class AddAllowUploadsToLabs < ActiveRecord::Migration
  def self.up
    add_column :labs, :allow_uploads, :boolean
  end

  def self.down
    remove_column :labs, :allow_uploads
  end
end
