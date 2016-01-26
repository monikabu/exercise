system 'rm Gemfile' if File.exist?('Gemfile')
File.write('Gemfile', <<-GEMFILE)
  source 'https://rubygems.org'
  gem 'rspec'
GEMFILE

system 'bundle install'

require 'bundler'
Bundler.setup(:default)

require 'rspec'
require 'logger'

system 'rspec spec'
