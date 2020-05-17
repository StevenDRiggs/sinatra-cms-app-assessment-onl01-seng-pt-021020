class SeedsController < ApplicationController

  # GET: /seeds
  get "/seeds" do
    @seeds = Seed.all

    erb :"/seeds/index.html"
  end

  # GET: /seeds/new
  get "/seeds/new" do
    erb :"/seeds/new.html"
  end

  # POST: /seeds
  post "/seeds" do
    redirect "/seeds"
  end

  # GET: /seeds/5
  get "/seeds/:id" do
    @seed = Seed.find_by_id(params[:id])

    erb :"/seeds/show.html"
  end

  # GET: /seeds/5/edit
  get "/seeds/:id/edit" do
    erb :"/seeds/edit.html"
  end

  # PATCH: /seeds/5
  patch "/seeds/:id" do
    redirect "/seeds/:id"
  end

  # DELETE: /seeds/5/delete
  delete "/seeds/:id/delete" do
    redirect "/seeds"
  end
end
