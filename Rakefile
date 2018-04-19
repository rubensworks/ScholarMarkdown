# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'juwelier'
Juwelier::Tasks.new do |gem|
  gem.name = "scholarmarkdown"
  gem.homepage = "http://github.com/rubensworks/ScholarMarkdown"
  gem.license = "MIT"
  gem.summary = "A framework for writing markdown-based scholarly articles."
  gem.email = "rubensworks@gmail.com"
  gem.authors = ["Ruben Taelman"]
  gem.executables = ['generate-scholarmarkdown']
end
Juwelier::RubygemsDotOrgTasks.new
