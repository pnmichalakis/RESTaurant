class ApplicationController < Sinatra::Base
	helpers Sinatra::AuthenticationHelper
ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'restaurant_database'
	})

set :views, File.expand_path('../../views',__FILE__)
set :public, File.expand_path('../../public',__FILE__)


enable :sessions, :method_override

	get '/' do
		redirect '/foods'
	end

	get '/foods' do
		@foods = Food.all
		erb :'/food/index'
	end
	get '/foods/new' do
	authenticate!
	erb :'/food/new'
end

post '/foods' do
	new_name = params['food_name']
	new_price = params['food_price']
	food = Food.create({name: new_name, price: new_price})
	if food.valid?
		redirect '/foods'
	else
		@errors = food.errors.full_messages
		erb :'food/new'
	end
end

get '/foods/:id/edit' do
authenticate!
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
end