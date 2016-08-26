# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( style.css )

Rails.application.config.assets.precompile += %w( animate_login_n_reg.css )
Rails.application.config.assets.precompile += %w( events.css )
Rails.application.config.assets.precompile += %w( login_n_reg.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( event_index.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )


Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( event_index.js )
Rails.application.config.assets.precompile += %w( jquery-1.11.0.min.js )
Rails.application.config.assets.precompile += %w( modernizr-2.7.1.js )
Rails.application.config.assets.precompile += %w( util.js )
Rails.application.config.assets.precompile += %w( skel.min.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
