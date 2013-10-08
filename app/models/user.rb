class User < ActiveRecord::Base

  has_secure_password

  EMAIL_REG = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  validates :name,  presence: true, length: {maximum: 50}
  validates :email, presence: true, format: {with: EMAIL_REG},
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
