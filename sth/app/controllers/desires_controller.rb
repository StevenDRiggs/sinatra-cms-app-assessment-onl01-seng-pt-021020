class DesiresController < ApplicationController

  get "/desires" do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desires = Desire.all

    erb :"/desires/index.html"
  end

  post '/desires' do
    if params[:name] != ''
      Desire.create(name: params[:name], description: params[:description])
    end

    redirect '/bible_references/new'
  end

  get "/desires/new" do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    erb :"desires/new.html"
  end

  get "/desires/:id" do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @desire = Desire.find_by_id(params[:id])

    erb :"/desires/show.html"
  end

end
