class UserMailer < ActionMailer::Base
  default from: "hotelshaque@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reserve_confirmation.subject
  #
  def reserve_confirmation
    @greeting = "Hi"

    mail to: "ehaque@gmail.com", subject:"HotelBD: Test Email" 
  end
end
