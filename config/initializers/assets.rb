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

#Admin pages -------------------------------------------------------------------
#CSS
Rails.application.config.assets.precompile += %w( admin/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css )
Rails.application.config.assets.precompile += %w( admin/AdminLTE.min.css )
Rails.application.config.assets.precompile += %w( admin/skins/_all-skins.min.css )
#SCRIPTS
Rails.application.config.assets.precompile += %w( admin/plugins/jQuery/jquery-2.2.3.min.js )
Rails.application.config.assets.precompile += %w( admin/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/select2/select2.full.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/input-mask/jquery.inputmask.js )
Rails.application.config.assets.precompile += %w( admin/plugins/input-mask/jquery.inputmask.date.extensions.js )
Rails.application.config.assets.precompile += %w( admin/plugins/input-mask/jquery.inputmask.extensions.js )
Rails.application.config.assets.precompile += %w( https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/daterangepicker/daterangepicker.js )
Rails.application.config.assets.precompile += %w( admin/plugins/datepicker/bootstrap-datepicker.js )
Rails.application.config.assets.precompile += %w( admin/plugins/colorpicker/bootstrap-colorpicker.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/timepicker/bootstrap-timepicker.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/slimScroll/jquery.slimscroll.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/iCheck/icheck.min.js )
Rails.application.config.assets.precompile += %w( admin/plugins/fastclick/fastclick.js )
Rails.application.config.assets.precompile += %w( admin/app.js )
Rails.application.config.assets.precompile += %w( admin/demo.js )
Rails.application.config.assets.precompile += %w( admin/geral.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
