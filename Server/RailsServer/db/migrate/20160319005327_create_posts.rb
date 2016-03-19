class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :item
      t.integer :quantity
      t.integer :expir
      t.integer :picktime
      t.string :loc
      t.string :super
      t.string :org

      t.timestamps null: false
    end
  end
end
