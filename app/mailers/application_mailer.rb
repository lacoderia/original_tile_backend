class ApplicationMailer < ActionMailer::Base
  
  default from: "\"Tile Design Studio\" <tile_design_studio@gmail.com>"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Activación de cuenta")
  end
  
end
