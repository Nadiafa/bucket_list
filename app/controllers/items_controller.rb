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
    erb :'items/new'
  end 

  post '/items' do 
    if params[:title] != "" && params[:description] != ""
      @item = Item.create(title: params[:title], description: params[:description], user_id: current_user.id)
      redirect "/items/#{@item.id}"        
    else
      redirect "/new"          
    end
  end 

  get '/items/:id/edit' do
    @item = Item.find_by(id: params[:id])
    if @item.user == current_user
      erb :'items/edit'
    else 
      redirect "/users/#{current_user.id}"
    end
  end

  patch '/items/:id' do 
    @item = Item.find(params[:id])
    if @item.user == current_user
      @item.update(title: params[:title], description: params[:description])
      redirect "/items/#{@item.id}"
    else 
      redirect "/items/#{current_user.id}"
    end 
  end 

end