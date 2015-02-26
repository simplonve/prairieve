class User < ActiveRecord::Base
  has_secure_password
  has_many :visits
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  def self.login(email, password)
    user = User.find_by(email: email.downcase)
    user.authenticate(password) if user
  end
end