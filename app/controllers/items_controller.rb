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

end