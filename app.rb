require 'rubygems'
require 'sinatra'
require 'haml'
require 'compass'

# Helpers
require './lib/helpers'

# Set Sinatra variables
set :app_file, __FILE__
set :root    , File.dirname(__FILE__)
set :views   , 'views'
set :public  , 'public'
set :haml    , { format: :html5 }
set :sass    , Compass.sass_engine_options

# Application routes
get '/styles/:name.css' do
  style = :"styles/#{params[:name]}"

  content_type 'text/css', charset: 'utf-8'
  sass style
end

get '/scripts/:name.js' do
  script = :"scripts/#{params[:name]}"

  content_type 'text/javascript'
  coffee script
end

get '/' do
  haml :index, layout: :'layouts/application'
end

get '/:page' do
  page = :"site/#{params[:page]}"
  haml page, layout: :'layouts/application'
end

get '/projects/:project/?' do
  page = :"site/projects/#{params[:project]}"
  haml page, layout: :'layouts/application'
end
