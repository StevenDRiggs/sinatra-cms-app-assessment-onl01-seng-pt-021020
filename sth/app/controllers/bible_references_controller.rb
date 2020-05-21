class BibleReferencesController < ApplicationController

  get '/bible_references' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @bible_references = BibleReference.all

    erb :'/bible_references/index.html'
  end

  get '/bible_references/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @bible_references = BibleReference.all
    @desires = Desire.all
    @seeds = Seed.all
    @harvests = Harvest.all

    erb :'/bible_references/new.html'
  end

  post '/bible_references' do
    if params[:reference] != ''
      bible_reference = BibleReference.new(reference: params[:reference], content: params[:content])

      if !(params[:desires].length == 1 && params[:desires][0] == '')
        for desire_id in params[:desires]
          bible_reference.desires << Desire.find_by_id(desire_id)
        end
      end

      if !(params[:seeds].length == 1 && params[:seeds][0] == '')
        for seed_id in params[:seeds]
          bible_reference.seeds << Seed.find_by_id(seed_id)
        end
      end

      if !(params[:harvests].length == 1 && params[:harvests][0] == '')
        for harvest_id in params[:harvests]
          bible_reference.harvests << Harvest.find_by_id(harvest_id)
        end
      end

      bible_reference.save
    end

    redirect '/bible_references'
  end

  get '/bible_references/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @bible_reference = BibleReference.find_by_id(params[:id])

    erb :'/bible_references/show.html'
  end

  get '/bible_references/:id/delete' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @bible_reference = BibleReference.find_by_id(params[:id])

    erb :'/bible_references/delete.html'
  end

  delete '/bible_references/:id' do
    BibleReference.find_by_id(params[:id]).delete

    redirect '/bible_references'
  end

end
