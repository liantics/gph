class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :blurb, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :cost, presence: true
  validates :title, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :category

  has_many :levels, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy

  def received_donations
    calculate_donations
  end

  private

  def calculate_donations
    donations = Donation.where(project_id: self.id)
    donations.map {|donation| donation["amount"]}.reduce(0, :+)
  end
end
