class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.references :semester
      t.references :course
      t.string :call_number
      t.string :section_number
      t.string :meeting_days
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
