class AppMailer < ActionMailer::Base
  def send_welcome_email(user)
    @user = user
    mail to: user.email, from: "hello@myflix.com", subject: "Welcome to Myflix"
  end
end