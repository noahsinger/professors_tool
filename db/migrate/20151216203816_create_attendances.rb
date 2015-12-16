class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :attendance_status
      t.references :meeting
      t.references :enrollment

      t.timestamps
    end
    add_index :attendances, :attendance_status_id
    add_index :attendances, :meeting_id
    add_index :attendances, :enrollment_id
  end
end
