class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :location
      t.integer :user_type

      t.timestamps null: false
    end
  end
end
