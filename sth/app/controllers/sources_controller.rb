class SourcesController < ApplicationController

  # index
  get '/sources' do
    @sources = Source.all

    erb :'/sources/index.html'
  end

  # new
  get '/sources/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @received_items = ReceivedItem.all

    erb :'/sources/new.html'
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

      redirect "/sources/#{source.id}"
    end

    redirect '/sources/new'
  end

  # show
  get '/sources/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @source = Source.find_by_id(params[:id])
    @bible_references = @source.harvests.collect {|harvest| harvest.bible_references}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq
    @targets = @bible_references.collect {|bible_reference| bible_reference.seeds}.flatten.uniq.collect {|seed| seed.targets}.flatten.uniq

    erb :'/sources/show.html'
  end

end
