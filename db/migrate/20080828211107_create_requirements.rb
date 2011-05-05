class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.references :lab
      t.string :description
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
