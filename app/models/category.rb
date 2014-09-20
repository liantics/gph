class Category < ActiveRecord::Base
  validates :name, presence: true 
  validates :user_id, presence: true
  validates :name, uniqueness: { scope: :category_type }

  belongs_to :user
  has_many :projects

  def projects_in_category
    Project.joins(:category).where(
      "project.category = ?", id
    )
  end
end
