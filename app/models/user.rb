class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :categories
  has_many :projects
  has_many :levels

  mount_uploader :image, ImageUploader

  def donated_to
    projects_user_donated_to
  end

  def allowed_to_modify?(object)
    is_owner?(object) || is_site_admin?
  end

  def disable
    update(account_enabled: false)
  end

  private

  def projects_user_donated_to
    Project.joins(:donations).where(
      "donations.user_id = ?", id
    ).uniq
  end

  def is_owner?(object)
    id == object.user_id
  end

  def is_site_admin?
    site_admin?
  end
end
