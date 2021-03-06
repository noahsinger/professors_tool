class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :discipline
      t.string :number
      t.integer :credits

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
