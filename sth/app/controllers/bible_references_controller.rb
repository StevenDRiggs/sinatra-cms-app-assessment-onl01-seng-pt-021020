class BibleReferencesController < ApplicationController

  # index
  get '/bible_references' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/bible_references/index.html'
  end

  # new
  get '/bible_references/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/bible_references/new.html'
  end

  post '/bible_references' do
    user = User.find_by_id(session[:rd])
    bible_reference = user.bible_references.build(reference: params[:reference], content: params[:content])

    if !(params[:desires].nil? || (params[:desires].length == 1 && params[:desires][0] == ''))
      for desire_id in params[:desires]
        bible_reference.desires << Desire.find_by(user_id: user.id, id: desire_id)
      end
    end

    if !(params[:seeds].nil? || (params[:seeds].length == 1 && params[:seeds][0] == ''))
      for seed_id in params[:seeds]
        bible_reference.seeds << Seed.find_by(user_id: user.id, id: seed_id)
      end
    end

    if !(params[:harvests].nil? || (params[:harvests].length == 1 && params[:harvests][0] == ''))
      for harvest_id in params[:harvests]
        bible_reference.harvests << Harvest.find_by(user_id: user.id, id: harvest_id)
      end
    end

    bible_reference.save

    redirect "/bible_references/#{bible_reference.id}"
  end

  # show
  get '/bible_references/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @bible_reference = BibleReference.find_by(user_id: user.id, id: params[:id])

    erb :'/bible_references/show.html'
  end

  # edit
  get '/bible_references/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])
    @bible_reference = BibleReference.find_by(user_id: @user.id, id: params[:id])

    erb :'/bible_references/edit.html'
  end

  patch '/bible_references/:id' do
    user = User.find_by_id(session[:rd])
    bible_reference = BibleReference.find_by(user_id: user.id, id: params[:id])

    if bible_reference
      bible_reference.update(reference: params[:reference], content: params[:content])

      bible_reference.desires = []
      if !(params[:desires].nil? || (params[:desires].length == 1 && params[:desires][0] == ''))
        for desire_id in params[:desires]
          desire = Desire.find_by(user_id: user.id, id: desire_id)
          bible_reference.desires << desire if !bible_reference.desires.include?(desire)
        end
      end

      bible_reference.seeds = []
      if !(params[:seeds].nil? || (params[:seeds].length == 1 && params[:seeds][0] == ''))
        for seed_id in params[:seeds]
          seed = Seed.find_by(id: seed_id, user_id: session[:rd])
          bible_reference.seeds << seed if !bible_reference.seeds.include?(seed)
        end
      end

      bible_reference.harvests = []
      if !(params[:harvests].nil? || (params[:harvests].length == 1 && params[:harvests][0] == ''))
        for harvest_id in params[:harvests]
          harvest = Harvest.find_by(user_id: user.id, id: harvest_id)
          bible_reference.harvests << harvest if !bible_reference.harvests.include?(harvest)
        end
      end

      bible_reference.save

      redirect "/bible_references/#{bible_reference.id}"
    end

    redirect '/bible_references/new'
  end

  # delete
  get '/bible_references/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    @bible_reference = BibleReference.find_by(user_id: session[:rd], id: params[:id])

    erb :'/bible_references/delete.html'
  end

  delete '/bible_references/:id' do
    BibleReference.find_by(user_id: session[:rd], id: params[:id]).delete

    redirect '/bible_references'
  end

end
