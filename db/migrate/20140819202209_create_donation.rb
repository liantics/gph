class CreateDonation < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :level, index: true, null: false

      t.timestamps null: false
    end
  end
end
