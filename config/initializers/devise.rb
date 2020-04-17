Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  config.omniauth :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'], callback_url: "https://gotta-go-yo.herokuapp.com/users/auth/facebook/callback"
  # "https://gotta-go-yo.herokuapp.com/users/auth/facebook/callback"
  #"http://localhost:3000/auth/facebook/callback"

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end
