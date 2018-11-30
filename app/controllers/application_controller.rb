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
    def logged_in?
      !!current_user
    end 
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

###
  def already_logged_in
    if logged_in?
      flash[:already_logged_in] = "You were already logged in!"
      redirect "/users/#{current_user.id}"
    end
  end
end
