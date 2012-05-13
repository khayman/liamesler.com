require 'rubygems'
require 'sinatra'
require 'haml'
require 'compass'

# Helpers
require './lib/helpers'
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root    , File.dirname(__FILE__)
set :views   , 'views'
set :public  , 'public'
set :haml    , { format: :html5}
set :sass    , Compass.sass_engine_options

# Application routes
get '/' do
  haml :index, :layout => :'layouts/application'
end

get '/about' do
  haml :about, :layout => :'layouts/page'
end