source 'https://rubygems.org'

gem 'cancancan'
gem 'devise'
gem 'devise_token_auth'
gem 'rack-cors', :require => 'rack/cors'
gem 'activeadmin', github: 'activeadmin'
#gem 'active_admin_datetimepicker'

#Vulnerability updates
gem "nokogiri", "~> 1.11.4"
gem "paperclip", "~> 5.2.0"
gem 'pg', '~> 0.18'

gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',    github: 'activerecord-hackery/ransack'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'draper',              '> 3.x'
gem 'active_model_serializers'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails',          github: 'rails/sass-rails' # For Sprockets 4
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # To reload UI changes
  gem 'guard-livereload'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  # Testing framework
  #gem 'rspec-rails'
  gem 'rspec-rails', '>= 3.5.0.beta1'
  # Functional testing
  gem 'capybara'
  # Testing factories
  gem "factory_girl_rails"
  # Testing coverage
  gem 'simplecov', :require => false
  # Clean database after each test
  gem 'database_cleaner',            github: 'pschambacher/database_cleaner', branch: 'rails5.0', ref: '430a957'
  #gem 'database_cleaner'
  # Manipulate time in tests
  gem 'timecop'
end
