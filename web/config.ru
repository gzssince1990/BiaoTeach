require 'rubygems'
require 'bundler'

# if ENV['RACK_ENV'] == 'development'
#   Bundler.require(:default, :development)
# else
#   Bundler.require(:default)
# end

Bundler.require(:default)

require './bin/app.rb'

run Sinatra::Application
