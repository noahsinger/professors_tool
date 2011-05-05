class AddRequiredMaterialsToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :required_materials, :text
  end

  def self.down
    remove_column :courses, :required_materials
  end
end
