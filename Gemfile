# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.13'
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'rspec-core', '~> 3.10'
  gem 'rspec-mocks', '~> 3.10'
  gem 'rspec-rails', '~> 5.0'
  gem 'selenium-webdriver'
  gem 'simplecov', '~> 0.21', require: false
  gem 'webdrivers'
end
