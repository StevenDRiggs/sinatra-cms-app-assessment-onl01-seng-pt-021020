class ReceivedItemsController < ApplicationController

  # index
  get '/received_items' do
    @received_items = ReceivedItem.all

    erb :'/received_items/index.html'
  end

  # new
  get '/received_items/new' do
    @sources = Source.all

    erb :'/received_items/new.html'
  end

  post '/received_items' do
    received_item = ReceivedItem.create(item: params[:item], source: Source.find_by_id(params[:source]))

    redirect "/received_items/#{received_item.id}"
  end

  # show
  get '/received_items/:id' do
    @received_item = ReceivedItem.find_by_id(params[:id])

    erb :'/received_items/show.html'
  end

  # edit
  get '/received_items/:id/edit' do
    @received_item = ReceivedItem.find_by_id(params[:id])

    erb :'/received_items/edit.html'
  end

  patch '/received_items/:id' do
    received_item = ReceivedItem.find_by_id(params[id])
    received_item.update(item: params[:item], source: Source.find_by_id(params[:source]))

    redirect "/received_items/#{received_item.id}"
  end

  # delete
  get '/received_items/:id/delete' do
    @received_item = ReceivedItem.find_by_id(params[:id])

    erb :'received_items/delete.html'
  end

  delete '/received_items/:id' do
    ReceivedItem.find_by_id(params[:id]).delete

    redirect '/received_items'
  end

end
