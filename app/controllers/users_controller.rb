class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end