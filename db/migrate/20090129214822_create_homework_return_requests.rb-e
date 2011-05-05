class CreateHomeworkReturnRequests < ActiveRecord::Migration
  def self.up
    create_table :homework_return_requests do |t|
      t.string :email
      t.references :assignment
      t.references :enrollment

      t.timestamps
    end
  end

  def self.down
    drop_table :homework_return_requests
  end
end
