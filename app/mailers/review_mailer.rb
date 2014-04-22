class ReviewMailer < ActionMailer::Base
  default from: "admin@hacklife.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.notify.subject
  #
  def notify(user)
    @greeting = "Message from HackLife"
    mail to: user.email, subject: "New Life Hack Review!", body: "Your Life Hack has been reviewed!"
  end
end
