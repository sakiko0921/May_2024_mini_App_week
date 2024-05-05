class CreateHouseWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :house_works do |t|

      t.timestamps
    end
  end
end
