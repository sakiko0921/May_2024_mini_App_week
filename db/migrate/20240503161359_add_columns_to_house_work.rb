class AddColumnsToHouseWork < ActiveRecord::Migration[7.1]
  def change
    add_column :house_works, :work_name, :string
    add_column :house_works, :time, :integer
    add_column :house_works, :user_id, :bigint

    add_foreign_key :house_works, :users

    change_column_null :house_works, :work_name, false
    change_column_null :house_works, :time, false
  end
end
