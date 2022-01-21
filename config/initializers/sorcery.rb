Rails.application.config.sorcery.submodules = [:reset_password, :remember_me]
Rails.application.config.sorcery.submodules = [:session_timeout]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  config.session_timeout = 300
  config.session_timeout_from_last_action = true

  config.user_config do |user|
    user.reset_password_mailer = UserMailer
    user.reset_password_email_method_name = :reset_password_email
    user.remember_me_for = 180
    user.remember_me_token_persist_globally = true
  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = "User"
end
