Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true
  config.assets.precompile += %w( *.js *.css )

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "rafeek_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  config.logstasher.enabled = true

  # Each of the following lines are optional. If you want to selectively disable log subscribers.
  config.logstasher.controller_enabled = true
  config.logstasher.mailer_enabled = true
  config.logstasher.record_enabled = true
  config.logstasher.view_enabled = true
  config.logstasher.job_enabled = true

  # This line is optional if you do not want to suppress app logs in your <environment>.log
  config.logstasher.suppress_app_log = false


  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'rafeek.com.br' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :user_name => ENV['SG_USERNAME'],
    :password => ENV['SG_PASSWORD'],
    :domain => 'vortexdeveloper.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true

  }


  Cielo.setup do |config_cielo|
    # Altere para production ao final dos seus testes
    config_cielo.environment = :production

    # Número de afiliação fornecido pela cielo.
    # O numero padrão é o número usado para testes.
    # Utilize "1001734898" para testes Buy page Cielo e "1006993069" para Buy page loja
    config_cielo.numero_afiliacao = ENV['CIELO_FILIACAO']

    # Chave de acesso para autenticação.
    # O número padrão é o número usado para os testes.
    # hash para Buy Page Cielo: "e84827130b9837473681c2787007da5914d6359947015a5cdb2b8843db0fa832"
    # hash para Buy page Loja: "25fbb99741c739dd84d7b06ec78c9bac718838630f30b112d033ce2e621b34f3"
    config_cielo.chave_acesso = ENV['CIELO_CHAVE_ACESSO']

    # Após o processamento pela cielo, o usuário será redirecionado para uma página.
    # que é configurada abaixo, nessa action você pode consultar o status do TID
    # para poder mostrar na tela.
    config_cielo.return_path = "https://www.rafeek.com.br"
  end
end
