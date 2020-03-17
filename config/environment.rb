# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Allow url generation inside of emails
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

config.action_mailer.perform_deliveries = false


ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_LOGIN'],
  :password => ENV['SENDGRID_PWD'],
  :domain => 'monsite.fr',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}