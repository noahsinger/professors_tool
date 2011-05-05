class CreateSyllabusParts < ActiveRecord::Migration
  def self.up
    create_table :syllabus_parts do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :syllabus_parts
  end
end
