class Chapitre < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :ressources

  def self.create_and_mail(hash)
    Chapitre.create(hash)
    User.all.each do |user|
      UserMailer.new_chapter(user, chapitre).deliver
    end
  end
end