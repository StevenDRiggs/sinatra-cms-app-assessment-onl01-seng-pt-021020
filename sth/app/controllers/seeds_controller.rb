class SeedsController < ApplicationController

  # index
  get '/seeds' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/seeds/index.html'
  end

  # new
  get '/seeds/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/seeds/new.html'
  end

  post '/seeds' do
    user = User.find_by_id(session[:rd])
    seed = user.seeds.build
    for target_id in params[:targets]
      seed.targets << Target.find_by(user_id: user.id, id: target_id)
    end

    seed.save

    redirect "/seeds/#{seed.id}"
  end

  # show
  get '/seeds/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @seed = Seed.find_by(user_id: user.id, id: params[:id])

    erb :'/seeds/show.html'
  end

  # edit
  get '/seeds/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @seed = Seed.find_by(user_id: @user.id, id: params[:id])

    erb :'/seeds/edit.html'
  end

  patch '/seeds/:id' do
    user = User.find_by_id(session[:rd])
    seed = Seed.find_by(user_id: user.id, id: params[:id])

    seed.targets =[]
    if !(params[:targets].nil? || (params[:targets].length == 1 && params[:targets][0] == ''))
      for target_id in params[:targets]
        target = Target.find_by(user_id: user.id, id: target_id)
        seed.targets << target if target
      end
    end

    seed.save

    redirect "/seeds/#{seed.id}"
  end

  # delete
  get '/seeds/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @seed = Seed.find_by(user_id: user.id, id:params[:id])

    erb :'/seeds/delete.html'
  end

  delete '/seeds/:id' do
    user = User.find_by_id(session[:rd])
    Seed.find_by(user_id: user.id, id: params[:id]).delete

    redirect '/seeds'
  end

end
