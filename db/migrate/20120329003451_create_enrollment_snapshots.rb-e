class CreateEnrollmentSnapshots < ActiveRecord::Migration
  def change
    create_table :enrollment_snapshots do |t|
      t.references :section
      t.integer :enrollment_count

      t.timestamps
    end
    add_index :enrollment_snapshots, :section_id
  end
end
