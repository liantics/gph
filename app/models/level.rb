class Level < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :user, presence: true
  validates :project, presence: true

  belongs_to :user
  belongs_to :project

  def self.by_amount
    order(amount: :asc)
  end
end
