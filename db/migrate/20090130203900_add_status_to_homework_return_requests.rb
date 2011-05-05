class AddStatusToHomeworkReturnRequests < ActiveRecord::Migration
  def self.up
    add_column :homework_return_requests, :status, :string
  end

  def self.down
    remove_column :homework_return_requests, :status
  end
end
