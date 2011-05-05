class CreateInstructors < ActiveRecord::Migration
  def self.up
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :phone_number
      t.string :office_number
      t.string :email
      t.string :website
      t.references :division

      t.timestamps
    end
  end

  def self.down
    drop_table :instructors
  end
end
