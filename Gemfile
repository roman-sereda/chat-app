source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'turbolinks', '>= 5.0.0.beta2'

gem 'redis', '~> 3.2'
gem 'devise'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
