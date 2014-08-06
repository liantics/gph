class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :category_type, null: false 
      t.integer :user_id, null: false

      t.timestamps null: false 
    end
    add_index :categories, :user_id
  end
end
