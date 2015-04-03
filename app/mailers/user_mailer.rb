class UserMailer < ActionMailer::Base
  default from: "equipe@simplonco.ve"

  def reset_password(user)
    @url = 'truc'
    @user = user
    mail(to: @user.email, subject: t('.subject'))
  end

  def new_chapter(user, chapitre_id)
    @url = 'truc'
    @user = user
    @chapitre = Chapitre.find(chapitre_id)
    mail(to: @user.email, subject: "Nouveau Chapitre de la Prairie en ligne")
  end
end
