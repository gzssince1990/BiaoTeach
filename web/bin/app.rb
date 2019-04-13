require 'sinatra/base'
require 'sinatra/reloader'
require 'dotenv'
require 'sequel'
require_relative './init'
require_relative '../graphql/schema'

Dotenv.load

configure do
	set :static, true
	set :public_folder, "static"
	set :views, "views"
end

get '/' do
	"For my best love - Biao"
end

get '/user/:id' do |id|
	query_string = <<-GRAPHQL
	{
		user(id: #{id}) {
			id
		}
	}
	GRAPHQL

	result_hash = Schema.execute(query_string)
	result_hash.to_s
end
