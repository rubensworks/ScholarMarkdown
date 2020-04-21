source 'https://rubygems.org'

gem 'nanoc', '~> 4.7'

gem 'scholarmarkdown'

# text processing
gem 'kramdown'
gem 'rubypants'

# stylesheets
gem 'sass'

# references
gem 'i18n', '< 1.1'
gem 'latex-decode'
gem 'unicode_utils'
gem 'citeproc-ruby', '>= 1.1.6'
gem 'csl-styles'

group :development do
  # live view
  gem 'guard-nanoc', '~> 2.1.2'
  gem 'guard-rack'
  gem 'guard-livereload'
  gem 'rack'
  gem 'rack-livereload'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem 'rb-readline'
  gem 'rb-notifu' if Gem.win_platform?
end

group :test do
  # validation
  gem 'w3c_validators', '~> 1.3.1'
end
