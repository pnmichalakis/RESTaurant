
require 'bundler'
Bundler.require(:default)
Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end
require './helpers/link_helper'

map('/users'){ run UsersController }
map('/parties'){ run PartiesController }
map('/sessions'){ run SessionsController }
map('/'){ run ApplicationController }

