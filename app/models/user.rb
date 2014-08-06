class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :categories
  
  def allowed_to_modify?(object)
    is_owner?(object) || is_site_admin?
  end
  
  private

  def is_owner?(object)
    id = object.user_id
  end

  def is_site_admin?
    current_user.site_admin
  end
end