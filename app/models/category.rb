class Category < ActiveRecord::Base
  validates :name, presence: true 
  validates :user_id, presence: true
  validates :name, uniqueness: { scope: :category_type }

  belongs_to :user
end
