class ToSowItemsController < ApplicationController

  # index
  get '/to_sow_items' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/to_sow_items/index.html'
  end

  # new
  get '/to_sow_items/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/to_sow_items/new.html'
  end

  post '/to_sow_items' do
    user = User.find_by_id(session[:rd])
    to_sow_item = user.to_sow_items.build(item: params[:item], target: Target.find_by_id(params[:target]))

    to_sow_item.save

    redirect "/to_sow_items/#{to_sow_item.id}"
  end

  # show
  get '/to_sow_items/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @to_sow_item = ToSowItem.find_by(user_id: user.id, id: params[:id])

    erb :'/to_sow_items/show.html'
  end

  # edit
  get '/to_sow_items/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @to_sow_item = ToSowItem.find_by(user_id: @user.id, id: params[:id])

    erb :'/to_sow_items/edit.html'
  end

  patch '/to_sow_items/:id' do
    user = User.find_by_id(session[:rd])
    to_sow_item = ToSowItem.find_by(user_id: user.id, id: params[:id])
    if to_sow_item
      to_sow_item.item = params[:item]
      to_sow_item.target = Target.find_by(user_id: user.id, id: params[:target])

      to_sow_item.save

      redirect "/to_sow_items/#{to_sow_item.id}"
    end

    redirect '/to_sow_items/new'
  end

  # delete
  get '/to_sow_items/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @to_sow_item = ToSowItem.find_by(user_id: user.id, id: params[:id])

    erb :'/to_sow_items/delete.html'
  end

  delete '/to_sow_items/:id' do
    ToSowItem.find_by_id(params[:id]).delete

    redirect '/to_sow_items'
  end

end
