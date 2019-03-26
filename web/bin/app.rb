require 'sinatra/base'
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

get '/graphqltest' do
	query_string = "
	{
	user(id: 1) {
		id
	}
	}
	"
	result_hash = Schema.execute(query_string)
	result_hash.to_s
end
