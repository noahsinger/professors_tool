class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.string :email
      t.references :course

      t.timestamps
    end
    add_index :waiters, :course_id
  end
end
