class HarvestsController < ApplicationController

  # index
  get '/harvests' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/harvests/index.html'
  end

  # new
  get '/harvests/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sources = Source.all

    erb :'/harvests/new.html'
  end
  
  post '/harvests' do
    harvest = Harvest.new
    harvest.completed = params[:completed] == 'on'
    harvest.time_to_completion = "#{params[:months_to_completion]} months, #{params[:weeks_to_completion]} weeks, #{params[:days_to_completion]} days, #{params[:hours_to_completion]} hours, #{params[:minutes_to_completion]} minutes"

    if !params[:sources].nil?
      for source_id in params[:sources]
        harvest.sources << Source.find_by_id(source_id.to_i)
      end
    else
      'no source chosen'
    end

    harvest.save

    redirect "/harvests/#{harvest.id}"
  end

  # show
  get '/harvests/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @harvest = Harvest.find_by_id(params[:id])

    erb :'/harvests/show.html'
  end

  # edit
  get '/harvests/:id/edit' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @harvest = Harvest.find_by_id(params[:id])
    @sources = Source.all

    erb :'/harvests/edit.html'
  end

  patch '/harvests/:id' do
    harvest = Harvest.find_by_id(params[:id])
    harvest.completed = params[:completed] == 'on'
    harvest.time_to_completion = "#{params[:months_to_completion].to_i} months, #{params[:weeks_to_completion].to_i} weeks, #{params[:days_to_completion].to_i} days, #{params[:hours_to_completion].to_i} hours, #{params[:minutes_to_completion].to_i} minutes"

    harvest.sources = []
    if !(params[:sources].nil? || (params[:sources].length == 1 && params[:sources][0] == ''))
      for source_id in params[:sources]
        source = Source.find_by_id(source_id)
        harvest.sources << source if !source.nil?
      end
    end

    harvest.save

    redirect "/harvests/#{harvest.id}"
  end

  # delete
  get '/harvests/:id/delete' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @harvest = Harvest.find_by_id(params[:id])

    erb :'/harvests/delete.html'
  end

  delete '/harvests/:id' do
    Harvest.find_by_id(params[:id]).delete

    redirect '/harvests'
  end

end
