class ItemsController < ApplicationController
  
  get '/items' do 
    @items = Item.all 
    erb :'items/index'
  end 

  get '/items/:id' do 
    set_item_found_by_id
    erb :'items/show'
  end 

  get '/new' do
    if logged_in?
      erb :'items/new'
    else 
      not_logged_in_redirect
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
      not_logged_in_redirect
    end 
  end 

  get '/items/:id/edit' do
    set_item_found_by_id
    if logged_in?
      if @item.user == current_user
        erb :'items/edit'
      else 
        modify_restricted_redirect
      end
    else 
      not_logged_in_redirect
    end
  end

  patch '/items/:id' do 
    set_item_found_by_id
    if logged_in?
      if @item.user == current_user
        @item.update(title: params[:title], description: params[:description])
        flash[:successful_edit] = "You have successfully edited this Item!"
        redirect "/items/#{@item.id}"
      else 
        modify_restricted_redirect
      end 
    else 
      not_logged_in_redirect
    end
  end 

  delete '/items/:id' do 
    set_item_found_by_id
    if logged_in?
      if @item.user == current_user
        @item.destroy
        flash[:successful_delete] = "You have successfully deleted this Item!"
        redirect "/users/#{current_user.id}"
      else
        modify_restricted_redirect
      end 
    else 
      not_logged_in_redirect
    end 
  end 
end