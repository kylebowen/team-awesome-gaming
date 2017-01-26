source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails',                   '~> 5.0.1'
gem 'bcrypt',                  '~> 3.1.7'
gem 'faker',                   '~> 1'
gem 'carrierwave',             '~> 0.11'
gem 'mini_magick',             '~> 4.5'
gem 'fog',                     '~> 1.38'
gem 'will_paginate',           '~> 3.1'
gem 'bootstrap-will_paginate', '>= 0.0.10'
gem 'bootstrap-sass',          '~> 3.3'
gem 'puma',                    '~> 3.0'
gem 'sass-rails',              '~> 5.0'
gem 'uglifier',                '>= 3.0'
gem 'coffee-rails',            '~> 4.2'
gem 'jquery-rails',            '~> 4.1'
gem 'turbolinks',              '~> 5'
gem 'jbuilder',                '~> 2.5'


group :development, :test do
  gem 'sqlite3', '~> 1.3'
  gem 'byebug',  '~> 9.0', platform: :mri
end

group :development do
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '~> 3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0'
end

group :test do
  gem 'rails-controller-testing', '~> 0.1'
  gem 'minitest-reporters',       '~> 1.1'
  gem 'guard',                    '~> 2.13'
  gem 'guard-minitest',           '~> 2.4'
end

group :production do
  gem 'pg', '~> 0.18'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
