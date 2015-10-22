class User < ActiveRecord::Base

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save!
  end

  def is_password?(password) #crypted or uncrypted password arg?
    self.password_digest == BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(:email, email)

    unless user.nil?
      return false unless user.is_password?(password)
    end

    user
  end

end
