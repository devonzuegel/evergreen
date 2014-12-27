class User < ActiveRecord::Base
	# Downcase the email attribute before saving the user
  before_save { self.email = self.email.downcase }

	# Name validations
  validates :name, presence: true
  validates :name, length: { maximum: 50 }

	# Email validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

end
