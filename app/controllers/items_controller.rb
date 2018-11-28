class ItemsController < ApplicationController
  get '/index' do 
    @items = Item.all 
    erb :'/items/index'
  end 

end