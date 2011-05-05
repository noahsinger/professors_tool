class CreateGeneralContacts < ActiveRecord::Migration
  def self.up
    create_table :general_contacts do |t|
      t.string :return_email
      t.string :subject
      t.text :body
      t.string :attachment

      t.timestamps
    end
  end

  def self.down
    drop_table :general_contacts
  end
end
