if Rails.env.production?
  Wedding::Application.config.admin_username = ENV["admin_username"]
  Wedding::Application.config.admin_password = ENV["admin_password"]
  Wedding::Application.config.action_mailer.delivery_method = :smtp
  Wedding::Application.config.action_mailer.raise_delivery_errors = :true
  Wedding::Application.config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'tworingstorulethemall.com',
    :user_name            => 'wedding@tworingstorulethemall.com',
    :password             => ENV["email_password"],
    :authentication       => :plain,
    :enable_starttls_auto => true  }
end