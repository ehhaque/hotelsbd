Hotelsbd::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  # Mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  

   config.action_mailer.smtp_settings = {
    :address   => ENV["SMTP_SERVER"],
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => ENV["SMTP_USER"],
    :password  => ENV["SMTP_PWD"], # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'yourdomain.com', # your domain to identify your server when connecting
  }


  # Ehtesham Haque
  # Jul 17 2014
  # Needed For Mini Magick to work with ImageMagick
  ENV['PATH'] += File::PATH_SEPARATOR + 'C:\ImageMagick-6.8.9-Q16'
end
