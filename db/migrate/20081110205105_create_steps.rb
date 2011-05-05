class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.string :title
      t.text :instructions
      t.integer :position
      t.string :image
      t.references :how_to

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
