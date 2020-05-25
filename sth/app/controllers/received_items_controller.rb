class ReceivedItemsController < ApplicationController

  # index
  get '/received_items' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/received_items/index.html'
  end

  # new
  get '/received_items/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/received_items/new.html'
  end

  post '/received_items' do
    user = User.find_by_id(session[:rd])
    received_item = ReceivedItem.create(user_id: user.id, item: params[:item], source: Source.find_by(user_id: user.id, id: params[:source]))

    redirect "/received_items/#{received_item.id}"
  end

  # show
  get '/received_items/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @received_item = ReceivedItem.find_by(user_id: user.id, id: params[:id])

    erb :'/received_items/show.html'
  end

  # edit
  get '/received_items/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @received_item = ReceivedItem.find_by(user_id: @user.id, id: params[:id])

    erb :'/received_items/edit.html'
  end

  patch '/received_items/:id' do
    user = User.find_by_id(session[:rd])
    received_item = ReceivedItem.find_by(user_id: user.id, id: params[:id])
    received_item.update(item: params[:item], source: Source.find_by(user_id: user.id, id: params[:source]))

    redirect "/received_items/#{received_item.id}"
  end

  # delete
  get '/received_items/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @received_item = ReceivedItem.find_by(user_id: user.id, id: params[:id])

    erb :'received_items/delete.html'
  end

  delete '/received_items/:id' do
    ReceivedItem.find_by_id(params[:id]).delete

    redirect '/received_items'
  end

end
