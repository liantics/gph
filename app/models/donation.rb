class Donation < ActiveRecord::Base
  validates :user_id, presence: true
  validates :level_id, presence: true
  validates :amount, presence: true

  belongs_to :user
  belongs_to :level
end
