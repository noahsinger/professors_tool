class CreateAwardedPoints < ActiveRecord::Migration
  def self.up
    create_table :awarded_points do |t|
      t.references :work
      t.references :requirement
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :awarded_points
  end
end
