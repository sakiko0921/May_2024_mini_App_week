class DropModelTasks < ActiveRecord::Migration[7.1]
  def change
    drop_table :tasks do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "time", null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
