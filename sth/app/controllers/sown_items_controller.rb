class SownItemsController < ApplicationController

  # index
  get '/sown_items' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sown_items = SownItem.all

    erb :'/sown_items/index.html'
  end

  # new
  get '/sown_items/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @targets = Target.all

    erb :'/sown_items/new.html'
  end

  post '/sown_items' do
    sown_item = SownItem.create(item: params[:item], target: Target.find_by_id(params[:target]))

    redirect "/sown_items/#{sown_item.id}"
  end

  # show
  get '/sown_items/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sown_item = SownItem.find_by_id(params[:id])

    erb :'/sown_items/show.html'
  end

  # edit
  get '/sown_items/:id/edit' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sown_item = SownItem.find_by_id(params[:id])
    @targets = Target.all

    erb :'/sown_items/edit.html'
  end

  patch '/sown_items/:id' do
    sown_item = SownItem.find_by_id(params[:id])
    if sown_item
      sown_item.item = params[:item]
      sown_item.target = Target.find_by_id(params[:target])

      sown_item.save

      redirect "/sown_items/#{sown_item.id}"
    end

    redirect '/sown_items/new'
  end

  # delete
  get '/sown_items/:id/delete' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sown_item = SownItem.find_by_id(params[:id])

    erb :'/sown_items/delete.html'
  end

  delete '/sown_items/:id' do
    SownItem.find_by_id(params[:id]).delete

    redirect '/sown_items'
  end

end
