require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'restaurant'
	})


require_relative 'models/food'
require_relative 'models/party'
require_relative 'models/order'


get '/' do
	redirect '/foods'
end

get '/foods' do
	@foods = Food.all
	erb :'/food/index'
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
	food.update({name: new_name, price: new_price})
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



###


get '/parties' do
	@parties = Party.all
	erb :'/party/index'
end

get '/parties/new' do
	erb :'party/new'
end


post '/parties' do
	new_name = params['party_name']
	new_number = params['party_number']
	new_paid = params['party_paid']
	Party.create({name: new_name, number: new_number, paid: new_paid})
	redirect '/parties'
end

get '/parties/:id/edit' do
@party = Party.find(params[:id])
erb :'/party/edit'
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	new_name = params['party_name']
	new_number = params['party_number']
	new_paid = params['party_paid']
	party.update({name: new_name, number: new_number, paid: new_paid})
	redirect '/parties'
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	@order = Order.find(params[:id])
	erb :'/party/show'
end

delete '/parties/:id' do
	Party.delete(params[:id])
	redirect '/parties'
end


post '/parties/:id/orders' do
	# food = Food.where(name: params[:food_name])
	# @party = Party.find(params[:id])
	# @party.foods << food
	Order.create(params[:order])

	redirect '/parties'
end






