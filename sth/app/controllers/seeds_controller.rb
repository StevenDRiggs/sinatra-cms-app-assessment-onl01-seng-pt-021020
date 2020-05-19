class SeedsController < ApplicationController

  get '/seeds' do
    @seeds = Seed.all

    erb :'seeds/index.html'
  end

  get '/seeds/new' do
    @targets = Target.all

    erb :'seeds/new.html'
  end

  get '/seeds/:id' do
    @seed = Seed.find_by_id(params[:id])

    erb :'seeds/show.html'
  end

  get '/targets/new' do
    @items = Item.all

    erb :'seeds/targets/new.html'
  end

  get '/targets/:id' do
    @target = Target.find_by_id(params[:id])
    @bible_references = @target.seeds.collect {|seed| seed.bible_references}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq
    @sources = @bible_references.collect {|bible_reference| bible_reference.harvests}.flatten.uniq.collect {|harvest| harvest.sources}.flatten.uniq

    erb :'seeds/targets/show.html'
  end

end
