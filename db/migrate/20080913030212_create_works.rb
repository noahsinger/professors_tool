class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.references :assignment
      t.references :enrollment
      t.string :upload

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
