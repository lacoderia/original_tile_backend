class ApplicationMailer < ActionMailer::Base
  
  default from: "\"Tile Design Studio\" <tile_design_studio@gmail.com>"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Account authorized")
  end

  def registration_email(user)
    @user = user
    mail(to: user.email, subject: "Your registration is being reviewed")
  end

  def request_registration_email(user)
    @user = user
    mail(to: "sales@originalmissiontile.com", subject: "Petición de acceso")
  end

  def budget_email(user, email, attachment)
    @user = user
    attachments.inline['project.pdf'] = File.read(attachment)
    mail(to: email, subject: "Tile Design Studio Project")
  end
  
end
