class SorceryCore < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end
  end
end
