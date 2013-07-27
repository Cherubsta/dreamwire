ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtpout.secureserver.net",
  :port                 => 80,
  :domain               => "dreamwire.co",
  :user_name            => "support@dreamwire.co",
  :password             => "$$SPm00nSP$$",
  :authentication       => "plain",
  # :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"