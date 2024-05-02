class AddColumnsToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :time, :integer
    add_column :tasks, :user_id, :bigint

    add_foreign_key :tasks, :users
  end
end
