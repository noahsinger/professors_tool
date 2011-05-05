class CreateExtras < ActiveRecord::Migration
  def self.up
    create_table :extras do |t|
      t.string :file
      t.references :lab
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :extras
  end
end
