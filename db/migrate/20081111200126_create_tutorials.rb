class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.integer :position
      t.references :course
      t.references :how_to

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorials
  end
end
