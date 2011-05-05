class CreateObjectives < ActiveRecord::Migration
  def self.up
    create_table :objectives do |t|
      t.text :description
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :objectives
  end
end
