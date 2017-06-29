source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.4'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'simple_form'
gem 'friendly_id', '~> 5.1.0'
gem 'haml'

gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'tinymce-rails-imageupload', '~> 4.0.0.beta'

gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'fog-aws'
gem 'remotipart'

gem 'has_scope'
gem 'mailgun-ruby'
gem 'file_validators'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

group :production do 
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
end

path 'engines' do
  gem 'manager'
  gem 'site'
end