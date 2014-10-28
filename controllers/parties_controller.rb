class PartiesController < ApplicationController

get '/' do
	@parties = Party.all
	erb :'/party/index'
end

get '/new' do
	erb :'party/new'
end


post '/' do
	new_name = params['party_name']
	new_number = params['party_number']
	new_paid = params['party_paid']
	Party.create({name: new_name, number: new_number, paid: new_paid})
	redirect '/parties'
end

get '/:id/edit' do
@party = Party.find(params[:id])
erb :'/party/edit'
end

patch '/:id' do
	party = Party.find(params[:id])
	new_name = params['party_name']
	new_number = params['party_number']
	new_paid = params['party_paid']
	party.update({name: new_name, number: new_number, paid: new_paid})
	redirect '/parties'
end

get '/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	# @order = Order.find(params[:order])
	erb :'/party/show'
end

delete '/:id' do
	Party.delete(params[:id])
	redirect '/parties'
end


post '/:id/orders' do
	# food = Food.where(name: params[:food_name])
	#@party = Party.find(params[:id])
	# @party.foods << food
	Order.create(params[:order])

	redirect '/parties'
end

get '/:id/orders' do
	@party = Party.find(params[:id])
	@foods = Food.all
	# @order = Order.find(params[:id])
	erb :'/order/show'
end



get '/:id/orders/receipt' do
	authenticate!
	@party = Party.find(params[:id])
	@foods = Food.all
	@total = "This is where cost goes"
	# @order = Order.find(params[:order])
	erb :'/order/receipt'
end


patch '/:id/orders/checkout' do
	party = Party.find(params[:id])
	new_paid = "Yes"
	party.update({paid: new_paid})
	redirect '/parties'
end

delete '/parties/:id/orders' do
	Order.delete(params["order_id"])
	redirect '/parties'
end

end