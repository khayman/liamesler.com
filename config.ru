require 'rubygems'
require 'sinatra'
require 'bundler'

Bundler.require

require './app'
run Sinatra::Application
