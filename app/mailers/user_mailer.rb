class UserMailer < ActionMailer::Base
  default from: "brian@lumeo.pro"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "You are now a member of the Lumeo Learning Community"
  end
end
