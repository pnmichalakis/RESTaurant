require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'restaurant'
	})


require_relative 'models/food'
require_relative 'models/party'

get '/' do
	redirect '/foods'
end

get '/foods' do
	@foods = Food.all
	erb :index
end

get '/foods/new' do
	erb :'/food/new'
end

post '/foods' do
	new_name = params['food_name']
	new_price = params['food_price']
	Food.create({name: new_name, price: new_price})
	redirect '/foods'
end

get '/foods/:id/edit' do
@food = Food.find(params[:id])
erb :'/food/edit'
end

patch '/foods/:id' do
	food = Food.find(params[:id])
	new_name = params['food_name']
	new_price = params['food_price']
	food.update({name: new_name})
	redirect '/foods'
end

get '/foods/:id' do
	@food = Food.find(params[:id])
	erb :'/food/show'
end

delete '/foods/:id' do
	Food.delete(params[:id])
	redirect '/foods'
end