class DesiresController < ApplicationController

  # index
  get '/desires' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desires = Desire.all

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
      desire = Desire.create(name: params[:name], description: params[:description])

      redirect "/desires/#{desire.id}"
    end

    redirect '/desires/new'
  end

  # show
  get '/desires/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desire = Desire.find_by_id(params[:id])

    erb :'/desires/show.html'
  end

  # edit
  get '/desires/:id/edit' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desire = Desire.find_by_id(params[:id])

    erb :'/desires/edit.html'
  end

  patch '/desires/:id' do
    desire = Desire.find_by_id(params[:id])
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

    @desire = Desire.find_by_id(params[:id])

    erb :'/desires/delete.html'
  end

  delete '/desires/:id' do
    Desire.find_by_id(params[:id]).delete

    redirect '/desires'
  end

end
