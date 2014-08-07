class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :available, :boolean, null: false, default: true
  end
end
