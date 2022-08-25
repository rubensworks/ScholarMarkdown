source 'https://rubygems.org'

# webserver
gem 'puma'

# references
gem 'i18n'
gem 'bibtex-ruby'
gem 'latex-decode'
gem 'citeproc-ruby', '>= 1.1.6'
gem 'csl-styles'
gem 'bibmarkdown', '~> 2.0.0'

# math
gem 'katex'
gem 'sskatex'
gem 'kramdown-math-sskatex'
gem 'execjs'

# M1 Macs must use mini_racer. therubyracer is broken: https://github.com/rubyjs/libv8/issues/312
# Intel Macs may use either - but therubyracer requires `brew install v8@3.15` and `bundle config build.therubyracer --with-v8-dir=$(brew --prefix)/opt/v8@3.15`, while mini_racer works out of the box.
# New Linuxes may use either.
# Old Linuxes must use therubyracer, as mini_racer requires GCC 8+.
# Source: https://github.com/rubyjs/libv8/issues/312#issuecomment-1200269949
is_mac = RUBY_PLATFORM.include?('darwin')
gem 'mini_racer', install_if: is_mac
gem 'therubyracer', install_if: !is_mac
gem 'libv8-node', '16.10.0.0'

group :development do
  # management of this gem
  gem "bundler", "~> 2.0"
  gem "juwelier", "~> 2.4.7"
end
