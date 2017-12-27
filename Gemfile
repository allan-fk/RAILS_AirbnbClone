source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby                '2.3.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',        '5.1.4'

gem 'geocoder'
# gem 'gmaps4rails'

gem 'bootstrap-sass'
gem 'coffee-rails', '~>4.2'
gem 'devise'
gem 'devise-i18n'
gem 'font-awesome-rails'
gem 'jbuilder', '2.7.0'
gem 'jquery-rails'
# gem 'omniauth'
# gem 'omniauth-facebook'
gem 'paperclip', '5.0.0'
gem 'paperclip-cloudinary'
gem 'puma', '3.9.1'
gem 'sass-rails', '5.0.6'
gem 'toastr-rails'
gem 'turbolinks',   '5.0.1'
gem 'uglifier',     '3.2.0'

group :development, :test do
  gem 'byebug', '9.0.6', platform: :mri
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'sqlite3', '1.3.13'
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console',           '3.5.1'
end
group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'shoulda-matchers'
end
group :production do
  gem 'pg', '0.20.0'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
