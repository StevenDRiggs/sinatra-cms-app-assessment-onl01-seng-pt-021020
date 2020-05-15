class SeedToSowItemsController < ApplicationController

  # GET: /seed_to_sow_items
  get "/seed_to_sow_items" do
    erb :"/seed_to_sow_items/index.html"
  end

  # GET: /seed_to_sow_items/new
  get "/seed_to_sow_items/new" do
    erb :"/seed_to_sow_items/new.html"
  end

  # POST: /seed_to_sow_items
  post "/seed_to_sow_items" do
    redirect "/seed_to_sow_items"
  end

  # GET: /seed_to_sow_items/5
  get "/seed_to_sow_items/:id" do
    erb :"/seed_to_sow_items/show.html"
  end

  # GET: /seed_to_sow_items/5/edit
  get "/seed_to_sow_items/:id/edit" do
    erb :"/seed_to_sow_items/edit.html"
  end

  # PATCH: /seed_to_sow_items/5
  patch "/seed_to_sow_items/:id" do
    redirect "/seed_to_sow_items/:id"
  end

  # DELETE: /seed_to_sow_items/5/delete
  delete "/seed_to_sow_items/:id/delete" do
    redirect "/seed_to_sow_items"
  end
end
