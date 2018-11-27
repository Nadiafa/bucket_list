class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else 
      redirect "/login"
    end
  end 

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do 
    if params[:name] != "" && params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else 
      redirect "/signup"
    end 
  end 

  get '/logout' do
    session.clear
    redirect "/"
  end

end