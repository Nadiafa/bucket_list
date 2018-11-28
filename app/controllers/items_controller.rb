class ItemsController < ApplicationController
  get '/items' do 
    @items = Item.all 
    erb :'/items/index'
  end 

  get '/items/:id' do 
    @item = Item.find_by(id: params[:id])
    erb :'items/show'
  end 

end