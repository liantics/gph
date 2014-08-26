class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :level
  belongs_to :project
  
  validates :user, presence: true
  validates :level, presence: true
  validates :amount, presence: true
end
