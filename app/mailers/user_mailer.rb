class UserMailer < ActionMailer::Base
  default from: "noreply@ucsyd.dk"

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Velkommen til UCSyddanmarks Julekalender')
  end
end
