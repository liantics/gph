class Category < ActiveRecord::Base
  include ActiveCategoryTypes
  include GenerateColumnWidths

  validates :name, presence: true 
  validates :user_id, presence: true
  validates :name, uniqueness: { scope: :category_type }

  belongs_to :user
  has_many :projects
end
