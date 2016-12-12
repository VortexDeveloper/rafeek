# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.

Rails.application.config.assets.version = '1.0'

#Public pages ------------------------------------------------------------------
#CSS
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( boot.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( admin.css )
#SCRIPTS
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( geral.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( html5shiv.js )
Rails.application.config.assets.precompile += %w( jquery.modal.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )
Rails.application.config.assets.precompile += %w( dataTables.bootstrap.min.js )
Rails.application.config.assets.precompile += %w( data-table-rafeek.js )
Rails.application.config.assets.precompile += %w( image-click.js )
Rails.application.config.assets.precompile += %w( jquery_payment.min.js )
Rails.application.config.assets.precompile += %w( accounting.min.js )
Rails.application.config.assets.precompile += %w( populate_city_select.js )
Rails.application.config.assets.precompile += %w( admin-lte.js )
Rails.application.config.assets.precompile += %w( jquery.lazyload.js )
Rails.application.config.assets.precompile += %w( pagination.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
