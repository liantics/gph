class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :blurb, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :cost, precision: 10, default: 0, null: false
      t.timestamps null: false
    end
    add_index :projects, [:title, :user_id], unique: true
    add_index :projects, :category_id
  end
end
