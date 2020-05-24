class DesiresController < ApplicationController

  # index
  get '/desires' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/desires/index.html'
  end

  # new
  get '/desires/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    erb :'/desires/new.html'
  end

  post '/desires' do
    if params[:name] != ''
      user = User.find_by_id(session[:rd])
      desire = Desire.create(user_id: user.id, name: params[:name], description: params[:description])

      redirect "/desires/#{desire.id}"
    end

    redirect '/desires/new'
  end

  # show
  get '/desires/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    user  =User.find_by_id(session[:rd])
    @desire = Desire.find_by(user_id: user.id, id: params[:id])

    erb :'/desires/show.html'
  end

  # edit
  get '/desires/:id/edit' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @desire = Desire.find_by(user_id: user.id, id: params[:id])

    erb :'/desires/edit.html'
  end

  patch '/desires/:id' do
    user = User.find_by_id(session[:rd])
    desire = Desire.find_by(user_id: user.id, id: params[:id])

    if desire
      desire.update(name: params[:name], description: params[:description])

      redirect "/desires/#{desire.id}"
    end

    redirect '/desires/new'
  end

  # delete
  get '/desires/:id/delete' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desire = Desire.find_by(user_id: session[:rd], id: params[:id])

    erb :'/desires/delete.html'
  end

  delete '/desires/:id' do
    Desire.find_by(user_id: session[:rd], id: params[:id]).delete

    redirect '/desires'
  end

end
