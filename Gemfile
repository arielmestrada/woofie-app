source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'pg'
gem 'devise'
gem 'cancancan'
gem 'hamlit-rails'
gem 'bootstrap'
gem 'sassc-rails'
gem 'jquery-rails'
gem 'devise-bootstrapped'
gem 'httparty'
gem "font-awesome-sass"
gem "pusher"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :development do
  gem "web-console"
  gem 'pry'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Use Redis for Action Cable
gem "redis", "~> 4.0"
