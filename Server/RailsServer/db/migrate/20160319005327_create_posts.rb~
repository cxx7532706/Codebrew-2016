class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :item
      t.string :description
      t.datetime :quantity
      t.datetime :expir
      t.datetime :picktime
      t.string :loc
      t.string :super
      t.string :org

      t.timestamps null: false
    end
  end
end
