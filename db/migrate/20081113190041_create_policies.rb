class CreatePolicies < ActiveRecord::Migration
  def self.up
    create_table :policies do |t|
      t.references :syllabus_part
      t.references :course
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :policies
  end
end
