class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :blurb, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :cost, presence: true

  belongs_to :user
  belongs_to :category
end
