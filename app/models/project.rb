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
    calculate_received_donations
  end

  def percentage_of_goal
    calculate_percentage_of_goal
  end

  def percent_header_text
    if percentage_of_goal < 5
      "On the Way"
    else
      "#{percentage_of_goal} Percent of the Way"
    end
  end
  private

  def calculate_project_donations
    donations = Donation.where(project_id: id)
  end

  def calculate_received_donations
    calculate_project_donations.map { 
      |donation| donation["amount"] 
    }.reduce(0, :+)
  end

  def calculate_percentage_of_goal
    ((calculate_received_donations.to_f / cost.to_f) * 100).floor
  end
end
