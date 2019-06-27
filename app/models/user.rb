class User < ApplicationRecord
    before_save {self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :Fname, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
    validates :Lname, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
    validates :email, presence: true, length: { maximum: 80 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }
end
