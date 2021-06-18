source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'carrierwave'
gem 'easy_breadcrumbs'
gem 'pony'
gem 'pry'
gem 'puma'
gem 'rake'
gem 'require_all'
gem 'sinatra'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'

gem 'sitemap_generator'
gem "sinatra-flash"

gem 'pagy', '~> 3.13.0'

group :production do
  gem 'pg'
end

group :development do
  gem 'rerun'
  gem 'sqlite3'
  gem 'tux'
end

group :test do
  gem 'capybara'
  gem 'rack-test'
  gem 'rspec'
end
