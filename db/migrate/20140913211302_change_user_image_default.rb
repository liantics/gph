class ChangeUserImageDefault < ActiveRecord::Migration
  def up
    change_column :users, :image, :string, default: "DefaultAvatar.jpg"
  end
end
