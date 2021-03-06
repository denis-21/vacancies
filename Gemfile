source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
gem 'devise-bootstrap-views'
gem 'countries', require: 'countries/global'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'kaminari'
gem 'haml-rails'
gem 'paperclip',  git: 'git://github.com/thoughtbot/paperclip.git'
gem 'clean_data', git: 'git://github.com/xarimanx/clean_data.git'
gem 'bootstrap-datepicker-rails'
gem 'chart-js-rails'
gem 'groupdate'
gem 'aasm'
gem 'jquery-inputmask-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'site_prism'
  gem 'selenium-webdriver'
  gem 'quiet_assets'
  gem 'rubocop', require: false
end

group :test do
  gem 'simplecov',      require: false
  gem 'simplecov-json', require: false
  gem 'simplecov-rcov', require: false
  gem 'capybara-webkit', '1.7.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-byebug'
end
