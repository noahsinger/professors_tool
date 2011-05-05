class AddPrerequisiteToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :prerequisite, :string
  end

  def self.down
    remove_column :courses, :prerequisite
  end
end
