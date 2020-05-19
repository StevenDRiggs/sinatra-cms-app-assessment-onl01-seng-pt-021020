class HarvestsController < ApplicationController

  get '/harvests' do
    @harvests = Harvest.all

    erb :'harvests/index.html'
  end

  get '/harvests/:id' do
    @harvest = Harvest.find_by_id(params[:id])

    erb :'harvests/show.html'
  end
  
  get '/sources/new' do
    @received_items = ReceivedItem.all

    erb :'harvests/sources/new.html'
  end

  get '/sources/:id' do
    @source = Source.find_by_id(params[:id])
    @bible_references = @source.harvests.collect {|harvest| harvest.bible_references}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq
    @targets = @bible_references.collect {|bible_reference| bible_reference.seeds}.flatten.uniq.collect {|seed| seed.targets}.flatten.uniq

    erb :'harvests/sources/show.html'
  end

end
