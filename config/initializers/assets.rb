# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.

Rails.application.config.assets.version = '1.0'

#Public pages ------------------------------------------------------------------
#CSS
Rails.application.config.assets.precompile += %w( shadowbox.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( boot.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
#SCRIPTS
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( shadowbox.js )
Rails.application.config.assets.precompile += %w( geral.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( html5shiv.js )
Rails.application.config.assets.precompile += %w( jquery.modal.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )
Rails.application.config.assets.precompile += %w( dataTables.bootstrap.min.js )
Rails.application.config.assets.precompile += %w( data-table-rafeek.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
