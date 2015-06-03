class User < ActiveRecord::Base
  has_secure_password
  has_many :visits
  has_many :ressources
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  has_and_belongs_to_many :activites

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

  def self.inscription(email)
    save_and_reset_password(email)
  end

  def assign(activite)
    unless self.activites.include?(activite)  
      self.activites.push activite
    end
  end

  private
  def self.generate_password
    chars = [*('a'..'z'),*('A'..'Z'), *('0'..'9')]
    newpass = ""
    7.times do |i|
      newpass << chars[rand(chars.size-1)]
    end
    1.upto(7) { |i| newpass << chars[rand(chars.size-1)] }
    newpass
  end

  def self.save_and_reset_password(email)
    tmp_pwd = generate_password
    user = new(email: email.downcase, name: email.split('@').first, password: tmp_pwd, password_confirmation: tmp_pwd)

    if user.save
      reset_password(user.email)
    else
      puts user.errors.full_messages
    end
    user
  end
end
