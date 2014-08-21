class Donation < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :level

  validates :user, presence: true
  validates :level, presence: true
  validates :amount, presence: true
=======
  validates :user_id, presence: true
  validates :level_id, presence: true
  validates :amount, presence: true

  belongs_to :user
  belongs_to :level
>>>>>>> Add donations to donation levels
end
