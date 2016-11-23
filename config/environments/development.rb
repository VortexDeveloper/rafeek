Rails.application.configure do
  config.active_job.queue_adapter = :sidekiq
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false

  # config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.smtp_settings = {
    address: 'smtp.vortexdeveloper.com',
    port: 587,
    domain: "vortexdeveloper.com",
    authentication: :login,
    enable_starttls_auto: true,
    user_name: 'noreply@vortexdeveloper.com',
    password: 'vorteX20**'
  }

  Cielo.setup do |config_cielo|
    # Altere para production ao final dos seus testes
    config_cielo.environment = :test

    # Número de afiliação fornecido pela cielo.
    # O numero padrão é o número usado para testes.
    # Utilize "1001734898" para testes Buy page Cielo e "1006993069" para Buy page loja
    config_cielo.numero_afiliacao = "1006993069"

    # Chave de acesso para autenticação.
    # O número padrão é o número usado para os testes.
    # hash para Buy Page Cielo: "e84827130b9837473681c2787007da5914d6359947015a5cdb2b8843db0fa832"
    # hash para Buy page Loja: "25fbb99741c739dd84d7b06ec78c9bac718838630f30b112d033ce2e621b34f3"
    config_cielo.chave_acesso = "25fbb99741c739dd84d7b06ec78c9bac718838630f30b112d033ce2e621b34f3"

    # Após o processamento pela cielo, o usuário será redirecionado para uma página.
    # que é configurada abaixo, nessa action você pode consultar o status do TID
    # para poder mostrar na tela.
    config_cielo.return_path = "http://localhost:3000"
  end
end
