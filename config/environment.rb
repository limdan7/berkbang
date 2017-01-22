# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '2525',
  :authentication => :plain,
  :user_name => 'berkbang',
  :password => 'bang1234',
  :domain => 'heroku.com',
  :enable_starttls_auto => true
}