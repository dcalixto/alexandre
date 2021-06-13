source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'activerecord', require: 'active_record'
gem 'puma'
gem 'rake'
gem 'require_all'
gem 'sinatra'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'carrierwave'

gem 'bcrypt'
gem 'pony'
gem 'pry'
gem 'sitemap_generator'

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
