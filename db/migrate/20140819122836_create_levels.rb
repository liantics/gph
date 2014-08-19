class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :amount, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :project, index: true, null: false

      t.timestamps null: false
    end
    add_index :levels, [:title, :project_id], unique: true
  end
end
