class CreateEnrollments < ActiveRecord::Migration
  def self.up
    create_table :enrollments do |t|
      t.references :student
      t.references :section
      t.references :enrollment_status

      t.timestamps
    end
  end

  def self.down
    drop_table :enrollments
  end
end
