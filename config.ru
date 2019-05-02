#Configuration for the server 
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require_relative './controller/posts_controller'

run PostController
