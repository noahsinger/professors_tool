class AddTwitterHandleToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :twitter_handle, :string

  end
end
