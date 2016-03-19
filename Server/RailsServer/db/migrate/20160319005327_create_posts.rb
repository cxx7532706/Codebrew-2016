class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   "item"
      t.integer  "quantity"
    	t.string   "loc"
    	t.string   "super"
    	t.string   "org"
    	t.datetime "created_at",           null: false
    	t.datetime "updated_at",           null: false
    	t.datetime "expir"
    	t.datetime "available_time_start"
    	t.datetime "available_time_end"
    	t.integer  "status"
    	t.string   "image"
    	t.datetime "picktime"
    	t.string   "description"

      t.timestamps null: false
    end
  end
end
