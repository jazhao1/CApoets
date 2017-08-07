# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( show.css )

Rails.application.config.assets.precompile += %w( admindash.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( submitpoemform.css )
Rails.application.config.assets.precompile += %w( admindash.css )
Rails.application.config.assets.precompile += %w( adminlogin.css )
Rails.application.config.assets.precompile += %w( adminwelcome.css )
Rails.application.config.assets.precompile += %w( materialize.css )
Rails.application.config.assets.precompile += %w( submitted.css )