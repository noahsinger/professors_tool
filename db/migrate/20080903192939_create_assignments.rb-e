class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :title
      t.datetime :duedate
      t.references :section
      t.references :lab

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
