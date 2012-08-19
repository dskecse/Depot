class ErrorNotifier < ActionMailer::Base
  default from: 'Dennis Dashkevich <dskecse@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.error_notifier.denied.subject
  #
  def denied(cart)
    @cart = cart
    mail to: 'dskecse@gmail.com', subject: 'Attempt to access invalid cart'
  end
end
