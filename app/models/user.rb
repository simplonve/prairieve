class User < ActiveRecord::Base
  has_secure_password
  has_many :visits
  has_many :ressources
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  def self.login(email, password)
    user = User.find_by(email: email.downcase)
    user.authenticate(password) if user
  end

  def generate_reset_password_key!
    chars = [*('a'..'z'),*('A'..'Z'), *('0'..'9')]
    rand_string = ""
    7.times do |i|
      rand_string << chars[rand(chars.size-1)]
    end
    key = Digest::SHA1.hexdigest("#{rand_string}#{self.email}")
    self.reset_password_key = key
    self.save!
  end

  def self.reset_password(email)
    user = User.where(email: email).first
    if user
      user.generate_reset_password_key!
      UserMailer.reset_password(user).deliver
    end
  end

  def update_password(password, password_confirmation)
    self.reset_password_key = nil
    self.password = password
    self.password_confirmation = password_confirmation
    self.save!
  end
end