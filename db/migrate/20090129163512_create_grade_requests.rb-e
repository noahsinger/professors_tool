class CreateGradeRequests < ActiveRecord::Migration
  def self.up
    create_table :grade_requests do |t|
      t.references :section
      t.references :enrollment
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :grade_requests
  end
end
