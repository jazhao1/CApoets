source 'https://rubygems.org'

# ruby '2.3.0' #Ruby version we're running
group :development, :test do
  gem 'sqlite3'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails', '3.4.2'
  gem 'ZenTest', '4.11.0'
end

group :test do
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem 'email_spec'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' #Heroku-specific production settings
  gem 'therubyracer'
end

gem 'haml-rails', '>= 0.3.4'
gem 'rails', '4.2.5'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
gem 'haml'

#ADD NEW GEMS HERE
gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem "mini_magick"
gem 'simple_form'
gem 'will_paginate', '~> 3.1.0'
gem 'devise'
# gem 'tinymce-rails'
gem "factory_girl_rails", "~> 4.0"

gem "selenium-webdriver"
gem 'nokogiri'
gem 'mechanize', '2.7.5'

gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', '>= 1.0.0.rc'
gem 'cancancan'

gem 'acts-as-taggable-on'
source 'https://rails-assets.org' do
  gem 'rails-assets-chosen'
end