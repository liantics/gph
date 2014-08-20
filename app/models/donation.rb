class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :level

  validates :user, presence: true
  validates :level, presence: true
  validates :amount, presence: true
end
