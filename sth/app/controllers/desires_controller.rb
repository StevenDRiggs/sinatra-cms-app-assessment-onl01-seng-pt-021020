class DesiresController < ApplicationController

  get "/desires" do
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
    erb :"desires/new.html"
  end

  get "/desires/:id" do
    @desire = Desire.find_by_id(params[:id])

    erb :"/desires/show.html"
  end

end
