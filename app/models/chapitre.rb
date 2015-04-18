class Chapitre < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :ressources

  def self.create_and_mail(hash)
    chapitre = Chapitre.new(hash)
    chapitre.save
    User.all.each do |user|
      UserMailer.new_chapter(user, chapitre.id).deliver
    end
  end
end