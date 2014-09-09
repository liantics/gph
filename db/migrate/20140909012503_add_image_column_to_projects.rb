class AddImageColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image, :string, null: false, default: "project/image/1"
  end
end
