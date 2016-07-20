class AddCourseIdToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :course_id, :integer
  end
end
