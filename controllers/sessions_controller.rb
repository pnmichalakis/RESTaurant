class SessionsController < ApplicationController
get '/new' do
  erb :'sessions/new'
end

post '/' do
  redirect '/' unless user = User.find_by({username: params[:username]})
  if user.password == params[:password]
    session[:current_user] = user.id
    redirect '/' # May redirect to... show
  else
    redirect '/' # May redirect to log-in
  end
end

# end

delete '/' do
  session[:current_user] = nil
  redirect '/'
end
end

