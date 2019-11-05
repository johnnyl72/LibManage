class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter_mailer.subject
  #
  def newsletter_mailer
    @subs = User.where(subscribed: true)
    @post = Post.last(1)
    emails = @subs.collect(&:email).join(", ")
    mail(to: emails, subject: "Hi, this is a test mail.")
  end

end
