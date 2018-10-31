source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Infrastructure
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'newrelic_rpm'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails_autoscale_agent', group: :production
gem 'aws-sdk-s3'
gem 'bugsnag'

# Back
gem 'simple_form'
gem 'breadcrumbs_on_rails'
gem 'jbuilder', '~> 2.5'
gem 'cancancan'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'image_processing'

# Front
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.1.3'
gem 'uglifier', '>= 1.3.0'
gem 'devise'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
