class HarvestSourcesController < ApplicationController

  # GET: /harvest_sources
  get "/harvest_sources" do
    erb :"/harvest_sources/index.html"
  end

  # GET: /harvest_sources/new
  get "/harvest_sources/new" do
    erb :"/harvest_sources/new.html"
  end

  # POST: /harvest_sources
  post "/harvest_sources" do
    redirect "/harvest_sources"
  end

  # GET: /harvest_sources/5
  get "/harvest_sources/:id" do
    erb :"/harvest_sources/show.html"
  end

  # GET: /harvest_sources/5/edit
  get "/harvest_sources/:id/edit" do
    erb :"/harvest_sources/edit.html"
  end

  # PATCH: /harvest_sources/5
  patch "/harvest_sources/:id" do
    redirect "/harvest_sources/:id"
  end

  # DELETE: /harvest_sources/5/delete
  delete "/harvest_sources/:id/delete" do
    redirect "/harvest_sources"
  end
end
