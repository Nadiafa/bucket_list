class ItemsController < ApplicationController
  
  get '/items' do 
    @items = Item.all 
    erb :'items/index'
  end 

  get '/items/:id' do 
    @item = Item.find_by(id: params[:id])
    erb :'items/show'
  end 

  get '/new' do
    if logged_in?
      erb :'items/new'
    else 
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end 
  end 

  post '/items' do 
    if logged_in?
      if params[:title] != "" && params[:description] != ""
        @item = Item.create(title: params[:title], description: params[:description], user_id: current_user.id)
        flash[:successful_create] = "You have successfully created a new Item!"
        redirect "/items/#{@item.id}"        
      else
        flash[:unsuccessful_create] = "We were unable to create a new Item. Please try again."
        redirect "/new"          
      end
    else 
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end 
  end 

  get '/items/:id/edit' do
    @item = Item.find_by(id: params[:id])
    if logged_in?
      if @item.user == current_user
        erb :'items/edit'
      else 
        flash[:modify_restricted] = "You can only modify your own items."
        redirect "/users/#{current_user.id}"
      end
    else 
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end
  end

  patch '/items/:id' do 
    @item = Item.find(params[:id])
    if logged_in?
      if @item.user == current_user
        @item.update(title: params[:title], description: params[:description])
        flash[:successful_edit] = "You have successfully edite this Item!"
        redirect "/items/#{@item.id}"
      else 
        flash[:modify_restricted] = "You can only modify your own items."
        redirect "/items/#{current_user.id}"
      end 
    else 
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end
  end 

  delete '/items/:id' do 
    @item = Item.find(params[:id])
    if logged_in?
      if @item.user == current_user
        @item.destroy
        flash[:successful_delete] = "You have successfully deleted this Item!"
        redirect "/users/#{current_user.id}"
      else
        flash[:modify_restricted] = "You can only modify your own items."
        redirect "/items"
      end 
    else 
      flash[:not_logged_in] = "Please log in or sign up on order to proceed."
      redirect "/"
    end 
  end 
end