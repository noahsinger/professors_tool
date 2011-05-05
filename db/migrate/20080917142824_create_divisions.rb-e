class CreateDivisions < ActiveRecord::Migration
  def self.up
    create_table :divisions do |t|
      t.string :name
      t.string :office_number
      t.string :phone_number
      t.string :associate_dean

      t.timestamps
    end
  end

  def self.down
    drop_table :divisions
  end
end
