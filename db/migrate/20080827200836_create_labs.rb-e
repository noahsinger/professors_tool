class CreateLabs < ActiveRecord::Migration
  def self.up
    create_table :labs do |t|
      t.references :course
      t.string :title
      t.string :objective
      t.text :instructions

      t.timestamps
    end
  end

  def self.down
    drop_table :labs
  end
end
