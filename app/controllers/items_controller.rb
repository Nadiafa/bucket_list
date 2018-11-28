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
      redirect "/"
    end 
  end 

  post '/items' do 
    if logged_in?
      if params[:title] != "" && params[:description] != ""
        @item = Item.create(title: params[:title], description: params[:description], user_id: current_user.id)
        redirect "/items/#{@item.id}"        
      else
        redirect "/new"          
      end
    else 
      redirect "/"
    end 
  end 

  get '/items/:id/edit' do
    @item = Item.find_by(id: params[:id])
    if logged_in?
      if @item.user == current_user
        erb :'items/edit'
      else 
        redirect "/users/#{current_user.id}"
      end
    else 
      redirect "/"
    end
  end

  patch '/items/:id' do 
    @item = Item.find(params[:id])
    if logged_in?
      if @item.user == current_user
        @item.update(title: params[:title], description: params[:description])
        redirect "/items/#{@item.id}"
      else 
        redirect "/items/#{current_user.id}"
      end 
    else 
      redirect "/"
    end
  end 

  delete '/items/:id' do 
    @item = Item.find(params[:id])
    if logged_in?
      if @item.user == current_user
        @item.destroy
        redirect "/items"
      else
        redirect "/items"
      end 
    else 
      redirect "/"
    end 
  end 

end