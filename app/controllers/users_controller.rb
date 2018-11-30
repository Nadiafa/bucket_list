class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      # flash[:already_logged_in] = "You were already logged in!"
      # redirect "/users/#{current_user.id}"
      already_logged_in
    end 
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:successful_login] = "You have successfully logged in!"
      redirect "/users/#{@user.id}"
    else 
      flash[:unsuccessful_login] = "Your credentials were invalid. Please try again."
      redirect "/login"
    end
  end 

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      # flash[:already_logged_in] = "You were already logged in!"
      # redirect "/users/#{current_user.id}"
      already_logged_in
    end 
  end

  post '/users' do 
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:successful_signup] = "You have successfully Signed Up!"
      redirect "/users/#{@user.id}"
    else 
      flash[:unsuccessful_signup] = "We were unable to sign you up. #{@user.errors.full_messages.to_sentence}."
      redirect "/signup"
    end
  end 

  get '/logout' do
    session.clear
     flash[:successful_logout] = "You have successfully logged out!"
    redirect "/"
  end

  get '/users/:id' do 
    @user = User.find_by(id: params[:id])
    if logged_in?
      erb :'users/show'
    else
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end 
  end 
end