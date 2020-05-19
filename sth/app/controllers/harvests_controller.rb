class HarvestsController < ApplicationController

  get '/harvests' do
    @harvests = Harvest.all

    erb :'harvests/index.html'
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
    @sources = Source.all

    erb :'harvests/new.html'
  end

  get '/harvests/:id' do
    @harvest = Harvest.find_by_id(params[:id])

    erb :'harvests/show.html'
  end
  
  get '/sources/new' do
    @received_items = ReceivedItem.all

    erb :'harvests/sources/new.html'
  end

  post '/sources' do
    if params[:name] != ''
      source = Source.new(name: params[:name])
      source.time_received = "#{params[:months_received]} months, #{params[:weeks_received]} weeks, #{params[:days_received]} days, #{params[:hours_received]} hours, #{params[:minutes_received]} minutes"
      source.money_received = params[:money_received].to_f
      source.received_items << ReceivedItem.create(item: params[:new_received_item]) if params[:new_received_item] != ''

      if !params[:received_items].nil?
        for received_item_id in params[:received_items]
          source.received_items << ReceivedItem.find_by_id(received_item_id)
        end
      end

      source.save

      redirect '/bible_references/new'
    end
  end

  get '/sources/:id' do
    @source = Source.find_by_id(params[:id])
    @bible_references = @source.harvests.collect {|harvest| harvest.bible_references}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq
    @targets = @bible_references.collect {|bible_reference| bible_reference.seeds}.flatten.uniq.collect {|seed| seed.targets}.flatten.uniq

    erb :'harvests/sources/show.html'
  end

end
