class AddSiteAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :site_admin, :boolean, null: false, default: false
  end
end
