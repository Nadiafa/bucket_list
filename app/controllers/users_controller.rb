class UsersController < ApplicationController

  get '/login' do
    already_logged_in_redirect
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in!"
      redirect "/users/#{@user.id}"
    else 
      flash[:warning] = "Your credentials were invalid. Please try again."
      redirect "/login"
    end
  end 

  get '/signup' do
    already_logged_in_redirect
    
    erb :'users/signup'
  end

  post '/users' do 
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:success] = "You have successfully Signed Up!"
      redirect "/users/#{@user.id}"
    else 
      flash[:warning] = "We were unable to sign you up. #{@user.errors.full_messages.to_sentence}."
      redirect "/signup"
    end
  end 

  get '/logout' do
    session.clear
    flash[:success] = "You have successfully logged out!"
    redirect "/"
  end

  get '/users/:id' do 
    set_user_found_by_id

    not_logged_in_redirect
    
    erb :'users/show'
  end 
end