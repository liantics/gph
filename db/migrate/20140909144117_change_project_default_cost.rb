class ChangeProjectDefaultCost < ActiveRecord::Migration
  def up
    change_column :projects, :cost, :integer, default: 1
  end
end
