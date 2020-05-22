class SeedsController < ApplicationController

  # index
  get '/seeds' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @seeds = Seed.all

    erb :'/seeds/index.html'
  end

  # new
  get '/seeds/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @targets = Target.all

    erb :'/seeds/new.html'
  end

  post '/seeds' do
    seed = Seed.new
    for target_id in params[:targets]
      seed.targets << Target.find_by_id(target_id)
    end

    seed.save

    redirect "/seeds/#{seed.id}"
  end

  # show
  get '/seeds/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @seed = Seed.find_by_id(params[:id])

    erb :'/seeds/show.html'
  end

  # delete
  get '/seeds/:id/delete' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @seed = Seed.find_by_id(params[:id])

    erb :'/seeds/delete.html'
  end

  delete '/seeds/:id' do
    Seed.find_by_id(params[:id]).delete

    redirect '/seeds'
  end

end
