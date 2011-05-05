class AddInstructorsCommentsToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :instructors_comments, :text
  end

  def self.down
    remove_column :works, :instructors_comments
  end
end
