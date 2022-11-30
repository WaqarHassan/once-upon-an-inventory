source 'https://rubygems.org'
ruby "3.1.3"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'pagy', '~> 3.5'
gem 'ajax-datatables-rails', '~> 1.3', '>= 1.3.1'
gem 'annotate'
gem 'psych', '< 4'

# group :development, :test do
#   gem 'byebug', platform: :mri
# end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'sqlite3'
  gem 'figaro'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'sprockets'
gem 'nokogiri'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem "paranoia", "~> 2.2"

