# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( application.js )
Rails.application.config.assets.precompile += %w( jquery_init.js )
Rails.application.config.assets.precompile += %w( devise.js )
Rails.application.config.assets.precompile += %w( edu.js )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( list.css )
Rails.application.config.assets.precompile += %w( question.css )
Rails.application.config.assets.precompile += %w( education.js )
Rails.application.config.assets.precompile += %w( employments.js)
Rails.application.config.assets.precompile += %w( topics.js)
Rails.application.config.assets.precompile += %w( questions.js)
Rails.application.config.assets.precompile += %w(answers.js)
Rails.application.config.assets.precompile += %w(edit.js)