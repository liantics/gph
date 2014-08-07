class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_enabled, :boolean, null: false, default: true
  end
end
