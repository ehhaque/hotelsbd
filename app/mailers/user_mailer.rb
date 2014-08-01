class UserMailer < ActionMailer::Base
  #default from: "admin@HotelBD.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reserve_confirmation.subject
  #
  def reserve_confirmation
    @greeting = "Hi"

    mail to: "ehaque@gmail.com", subject:"HotelBD: Test Email" 
  end

  def email_name
    mail :subject => "Mandrill Test!",
         :to      => "ehaque@gmail.com", 
         :from    => "admin@HotelBD.com"
    headers['X-MC-Template'] = "Hello"  # template
  end

  def reservation_email_conf(reservation)
    @reservation = reservation
    mail :subject => "HotelsBD Reservation Confirmation Email",
         :to      => "#{reservation.guest_email}", 
         :from    => "admin@HotelBD.com"
    headers['X-MC-Template'] = "Hello"  # template
  end

  
end
