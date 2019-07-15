class User < ApplicationRecord

    attr_accessor :remember_token, :activation_token
    before_save :downcase_email
    before_create :create_activation_digest

    # validation of User
    before_save {self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :Fname, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
    validates :Lname, presence: true, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
    validates :email, presence: true, length: { maximum: 80 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
    validates :password, confirmation: { case_sensitive: true }

    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persisent sessions
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    def forget
      update_attribute(:remember_digest, nil)
    end

    def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      # bug solve - The second subtlety is that a user could be logged in (and remembered) in multiple browsers,
      #   which causes a problem if the user logs out in the first browser but not the second,
      #   and then closes and re-opens the second one
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Activates an account.
    def activate
      update_attribute(:activated,    true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email.
    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end

    private

      # Converts email to all lower-case.
      def downcase_email
        self.email = email.downcase
      end
  
      # Creates and assigns the activation token and digest.
      def create_activation_digest
        self.activation_token  = User.new_token
        self.activation_digest = User.digest(activation_token)
      end

end
