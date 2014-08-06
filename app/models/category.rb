class Category < ActiveRecord::Base
  validates :name, presence: true 
  validates :user_id, presence: true

  belongs_to :user
end
