class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :level

  validates :user_id, presence: true
  validates :level_id, presence: true
  validates :amount, presence: true
end
