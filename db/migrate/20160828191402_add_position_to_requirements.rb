class AddPositionToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :position, :integer
  end
end
