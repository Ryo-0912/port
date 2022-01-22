Rails.application.config.sorcery.submodules = [:reset_password, :activity_logging, :session_timeout]


# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  config.session_timeout = 604800
  config.session_timeout_from_last_action = true

  config.user_config do |user|
    user.reset_password_mailer = UserMailer
    user.reset_password_email_method_name = :reset_password_email
  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = "User"
end
