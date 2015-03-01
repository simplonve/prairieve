class UserMailer < ActionMailer::Base
  default from: "equipe@simplon.ve"

  def reset_password(user)
    @url = 'truc'
    @user = user
    mail(to: @user.email, subject: t('.subject'))
  end
end
