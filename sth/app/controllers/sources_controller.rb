class SourcesController < ApplicationController

  # index
  get '/sources' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/sources/index.html'
  end

  # new
  get '/sources/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/sources/new.html'
  end

  post '/sources' do
    user = User.find_by_id(session[:rd])
    source = user.sources.build(name: params[:name])
    source.time_received = "#{params[:months_received]} months, #{params[:weeks_received]} weeks, #{params[:days_received]} days, #{params[:hours_received]} hours, #{params[:minutes_received]} minutes"
    source.money_received = params[:money_received].to_f
    source.received_items << user.received_items.build(item: params[:new_received_item]) if !(params[:new_received_item].nil? || params[:new_received_item] == '')

    if !(params[:received_items].nil? || (params[:received_items].length == 1 && params[:received_items][0] == ''))
      for received_item_id in params[:received_items]
        source.received_items << ReceivedItem.find_by(user_id: user.id, id: received_item_id)
      end
    end

    source.save

    redirect "/sources/#{source.id}"

    redirect '/sources/new'
  end

  # show
  get '/sources/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @source = Source.find_by(user_id: user.id, id: params[:id])
    @bible_references = @source.harvests.uniq.select {|harvest| harvest.user_id == user.id}.collect {|harvest| harvest.bible_references}.flatten.select {|bible_reference| bible_reference.user_id == user.id}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq.select {|desire| desire.user_id == user.id}.uniq

    erb :'/sources/show.html'
  end

  # edit
  get '/sources/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @source = Source.find_by(user_id: user.id, id: params[:id])

    erb :'/sources/edit.html'
  end

  patch '/sources/:id' do
    user = User.find_by_id(session[:rd])
    source = Source.find_by(user_id: user.id, id: params[:id])
    source.name = params[:name]
    source.time_received = "#{params[:months_received]} months, #{params[:weeks_received]} weeks, #{params[:days_received]} days, #{params[:hours_received]} hours, #{params[:minutes_received]} minutes"
    source.money_received = params[:money_received]

    source.received_items = []
    if !(params[:received_items].nil? || (params[:received_items].length == 1 && params[:received_items][0] == ''))
      for received_item_id in params[:received_items]
        received_item = ReceivedItem.find_by(user_id: user.id, id: received_item_id)
        source.received_items << received_item if received_item
      end
    end

    if !(params[:new_received_item].nil? || params[:new_received_item] == '')
      source.received_items.build(user_id: user.id, item: params[:new_received_item])
    end

    source.save

    redirect "/sources/#{source.id}"
  end

  # delete
  get '/sources/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @source = Source.find_by(user_id: user.id, id: params[:id])

    erb :'/sources/delete.html'
  end

  delete '/sources/:id' do
    user = User.find_by_id(session[:rd])
    Source.find_by(user_id: user.id, id: params[:id]).delete

    redirect '/sources'
  end

end
