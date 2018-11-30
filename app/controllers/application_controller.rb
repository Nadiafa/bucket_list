require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do 
  # User/log in helper methods
    def logged_in?
      !!current_user
    end 
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

  # User/Item find by id helper method
    def set_user_found_by_id
      @user = User.find_by(id: params[:id])
    end 

    def set_item_found_by_id
      @item = Item.find_by(id: params[:id])
    end 

  # Redirect and Flash message helper methods
    def already_logged_in_redirect
      if logged_in?
        flash[:already_logged_in] = "You were already logged in!"
        redirect "/users/#{current_user.id}"
      end
    end

    def not_logged_in_redirect
      if !logged_in?
        flash[:not_logged_in] = "Please log in or sign up on order to proceed."
        redirect "/"
      end 
    end

    def modify_restricted_redirect
      if @item.user != current_user
        flash[:modify_restricted] = "You can only modify your own items."
          redirect "/users/#{current_user.id}"
      end
    end 
  end
end 
