# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "nodomain.example.com",
    authentication:       "plain",
    user_name:            "nodomainexample@gmail.com",
    password:             "simple!234",
    enable_starttls_auto: true
  }
end