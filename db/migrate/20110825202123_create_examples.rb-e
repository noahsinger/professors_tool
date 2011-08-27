class CreateExamples < ActiveRecord::Migration
  def self.up
    create_table :examples do |t|
      t.string :name
      t.text :description
      t.string :file
      t.references :section

      t.timestamps
    end
  end

  def self.down
    drop_table :examples
  end
end
