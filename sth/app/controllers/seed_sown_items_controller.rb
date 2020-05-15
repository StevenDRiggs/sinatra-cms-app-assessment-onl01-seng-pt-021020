class SeedSownItemsController < ApplicationController

  # GET: /seed_sown_items
  get "/seed_sown_items" do
    erb :"/seed_sown_items/index.html"
  end

  # GET: /seed_sown_items/new
  get "/seed_sown_items/new" do
    erb :"/seed_sown_items/new.html"
  end

  # POST: /seed_sown_items
  post "/seed_sown_items" do
    redirect "/seed_sown_items"
  end

  # GET: /seed_sown_items/5
  get "/seed_sown_items/:id" do
    erb :"/seed_sown_items/show.html"
  end

  # GET: /seed_sown_items/5/edit
  get "/seed_sown_items/:id/edit" do
    erb :"/seed_sown_items/edit.html"
  end

  # PATCH: /seed_sown_items/5
  patch "/seed_sown_items/:id" do
    redirect "/seed_sown_items/:id"
  end

  # DELETE: /seed_sown_items/5/delete
  delete "/seed_sown_items/:id/delete" do
    redirect "/seed_sown_items"
  end
end
