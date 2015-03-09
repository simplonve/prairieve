class UserMailer < ActionMailer::Base
  default from: "equipe@simplon.ve"

  def reset_password(user)
    @url = 'truc'
    @user = user
    mail(to: @user.email, subject: t('.subject'))
  end

  def new_chapter(user, chapitre)
    @url = 'truc'
    @user = user
    @chapitre = chapitre
    mail(to: @user.email, subject: "Nouveau Chapitre de la Prairie en ligne")
  end
end
