class HarvestsController < ApplicationController

  get '/harvests' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @harvests = Harvest.all

    erb :'/harvests/index.html'
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

    redirect '/bible_references/new'
  end

  get '/harvests/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @sources = Source.all

    erb :'/harvests/new.html'
  end

  get '/harvests/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @harvest = Harvest.find_by_id(params[:id])

    erb :'/harvests/show.html'
  end
  

end
