class HarvestReceivedItemsController < ApplicationController

  # GET: /harvest_received_items
  get "/harvest_received_items" do
    erb :"/harvest_received_items/index.html"
  end

  # GET: /harvest_received_items/new
  get "/harvest_received_items/new" do
    erb :"/harvest_received_items/new.html"
  end

  # POST: /harvest_received_items
  post "/harvest_received_items" do
    redirect "/harvest_received_items"
  end

  # GET: /harvest_received_items/5
  get "/harvest_received_items/:id" do
    erb :"/harvest_received_items/show.html"
  end

  # GET: /harvest_received_items/5/edit
  get "/harvest_received_items/:id/edit" do
    erb :"/harvest_received_items/edit.html"
  end

  # PATCH: /harvest_received_items/5
  patch "/harvest_received_items/:id" do
    redirect "/harvest_received_items/:id"
  end

  # DELETE: /harvest_received_items/5/delete
  delete "/harvest_received_items/:id/delete" do
    redirect "/harvest_received_items"
  end
end
