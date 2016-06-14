ActionMailer::Base.default charset: 'utf-8'
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries    = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.default_url_options = {
    host: ENV['mailer_domain']
}
ActionMailer::Base.smtp_settings = {
    address:   ENV['mailer_address'],
    port:      587,
    user_name: ENV['mailer_sender'],
    password:  ENV['mailer_password'],
    authentication: :plain,
    enable_starttls_auto: true
}