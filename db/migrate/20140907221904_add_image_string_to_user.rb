class AddImageStringToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, null: true, default: "uploads/User/image/1"
  end
end
