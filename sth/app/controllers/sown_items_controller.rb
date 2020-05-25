class SownItemsController < ApplicationController

  # index
  get '/sown_items' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/sown_items/index.html'
  end

  # new
  get '/sown_items/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/sown_items/new.html'
  end

  post '/sown_items' do
    user = User.find_by_id(session[:rd])
    sown_item = user.sown_items.build(item: params[:item], target: Target.find_by_id(params[:target]))

    sown_item.save

    redirect "/sown_items/#{sown_item.id}"
  end

  # show
  get '/sown_items/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @sown_item = SownItem.find_by(user_id: user.id, id: params[:id])

    erb :'/sown_items/show.html'
  end

  # edit
  get '/sown_items/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @sown_item = SownItem.find_by(user_id: @user.id, id: params[:id])

    erb :'/sown_items/edit.html'
  end

  patch '/sown_items/:id' do
    user = User.find_by_id(session[:rd])
    sown_item = SownItem.find_by(user_id: user.id, id: params[:id])
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
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @sown_item = SownItem.find_by(user_id: user.id, id: params[:id])

    erb :'/sown_items/delete.html'
  end

  delete '/sown_items/:id' do
    user = User.find_by_id(session[:rd])
    SownItem.find_by(user_id: user.id, id: params[:id]).delete

    redirect '/sown_items'
  end

end
