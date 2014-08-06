class AddIndexToCategories < ActiveRecord::Migration
  def change
    add_index :categories, [:name, :category_type], unique: true
  end
end
