source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Infrastructure
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'bootsnap', require: false
gem 'rails_autoscale_agent', group: :production
gem 'aws-sdk-s3'
gem 'bugsnag'

# Back
gem 'rails', '~> 5.2.1'
gem 'rails-i18n'
gem 'devise'
gem 'devise-i18n'
gem 'image_processing'
gem 'simple_form'
gem 'breadcrumbs_on_rails'
gem 'jbuilder'
gem 'cancancan'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'kaminari-i18n'
gem 'geocoder'

# Front
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sassc'
gem 'bootstrap'
gem 'uglifier'
gem 'owlcarousel-rails'
gem 'font-awesome-sass'
gem 'gdpr'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'figaro'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
