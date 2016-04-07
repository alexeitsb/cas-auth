source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use mysql as the database for Active Record
  gem 'mysql2', '= 0.3.20'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby '2.3.0'
# Include 'rails_12factor' gem to enable all platform features (Heroku).
gem 'rails_12factor', group: :production
# Heroku database.
gem 'pg', group: :production
# Use unicorn as the app server.
gem 'unicorn'
# Postmark adapter for ActionMailer.
gem 'postmark-rails'
# Easy file attachment management for ActiveRecord.
gem 'paperclip'
# Documents validator.
gem 'validates_cnpj'
gem 'validates_cpf'
# Makes http fun again!
gem 'httparty'
# A scheduler process to replace cron.
gem 'clockwork'
# bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users' passwords.
gem 'bcrypt'
# Exception Notifier Plugin for Rails.
gem 'exception_notification'
# CASino is an easy to use Single Sign On (SSO) web application written in Ruby.
gem 'casino'
gem 'casino-activerecord_authenticator'

# WORKAROUND TO FIX
# Asset was not declared to be precompiled in production.
gem 'sprockets-rails', '2.3.3'