class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      # flash message to say you are already logged in
      flash[:already_logged_in] = "You were already logged in!"
      redirect "/users/#{current_user.id}"
    end 
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # flash message to say you have successfully logged in
      flash[:successful_login] = "You have successfully logged in!"
      redirect "/users/#{@user.id}"
    else 
      # flash message to say you have NOT logged in + errors
      flash[:unsuccessful_login] = "Your credentials were invalid. Please try again."
      redirect "/login"
    end
  end 

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      # flash message to say you are already logged in
      flash[:already_logged_in] = "You were already logged in!"
      redirect "/users/#{current_user.id}"
    end 
  end

  post '/users' do 
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id 
      # flash message to say you have successfully signed up
      flash[:successful_signup] = "You have successfully Signed Up!"
      redirect "/users/#{@user.id}"
    else 
      # flash message to say you have NOT signed up + errors
      flash[:unsuccessful_signup] = "We were unable to sign you up. #{@user.errors.full_messages.to_sentence}."
      redirect "/signup"
    end
  end 

  get '/logout' do
    session.clear
     # flash message to say you have successfully logged out
     flash[:successful_logout] = "You have successfully logged out!"
    redirect "/"
  end

  get '/users/:id' do 
    @user = User.find_by(id: params[:id])
    if logged_in?
      erb :'users/show'
    else
      # flash message to say you need to be logged in to proceed
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end 
  end 
end