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
    not_logged_in_redirect

    erb :'items/new'
  end 

  post '/items' do 
    not_logged_in_redirect

    @item = Item.new(title: params[:title], description: params[:description], user_id: current_user.id)
    if @item.save
      flash[:successful_create] = "You have successfully created a new Item!"
      redirect "/items/#{@item.id}"        
    else
      flash[:unsuccessful_create] = "We were unable to create a new Item. #{@item.errors.full_messages.to_sentence}"
      redirect "/new"          
    end
  end 

  get '/items/:id/edit' do
    set_item_found_by_id
    
    not_logged_in_redirect

    modify_restricted_redirect

    erb :'items/edit'
  end

  patch '/items/:id' do 
    set_item_found_by_id
    
    not_logged_in_redirect

    modify_restricted_redirect

    @item.update(title: params[:title], description: params[:description])
    flash[:successful_edit] = "You have successfully edited this Item!"
    redirect "/items/#{@item.id}" 
  end 

  delete '/items/:id' do 
    set_item_found_by_id
    
    not_logged_in_redirect

    modify_restricted_redirect

    @item.destroy
    flash[:successful_delete] = "You have successfully deleted this Item!"
    redirect "/users/#{current_user.id}"
  end 
end