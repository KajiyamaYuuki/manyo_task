class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy
  has_secure_password
  before_update :must_not_update_last_admin_user
  before_destroy :must_not_destroy_last_admin_user

  def must_not_destroy_last_admin_user
    throw(:abort) if User.where(admin: true).count == 1 && self.admin == true
  end

  def must_not_update_last_admin_user
    throw(:abort) if User.where(admin: true).count == 1 && !self.admin && self.admin_was
  end
end
