require 'sinatra'
require 'dotenv'

Dotenv.load

set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
	"For my best love - Biao"
end
