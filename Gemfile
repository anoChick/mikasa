source 'https://rubygems.org'
gem 'aws-sdk', '~> 2.0'
gem 'rails', '4.2.6'
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'dotenv-rails'
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'rmagick'
gem 'shoryuken', github: 'phstc/shoryuken', branch: 'master'


group :production, :staging do
  gem 'unicorn'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'capybara'
  gem 'poltergeist'
  gem 'rspec', '~> 3.4.0'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_rewinder'
  gem 'rspec-request_describer'
  gem 'autodoc'
  gem 'json_spec'
  gem 'byebug'
  gem 'faker'
  gem 'rubocop'
  gem 'simplecov'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'rack-mini-profiler'
  gem 'bullet'
  gem 'quiet_assets'
  gem 'rails_best_practices'
  gem 'did_you_mean'

  gem 'annotate'
end
