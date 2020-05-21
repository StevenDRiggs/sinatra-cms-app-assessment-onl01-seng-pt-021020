class SownItemsController < ApplicationController

  # GET: /sown_items
  get "/sown_items" do
    erb :"/sown_items/index.html"
  end

  # GET: /sown_items/new
  get "/sown_items/new" do
    erb :"/sown_items/new.html"
  end

  # POST: /sown_items
  post "/sown_items" do
    redirect "/sown_items"
  end

  # GET: /sown_items/5
  get "/sown_items/:id" do
    erb :"/sown_items/show.html"
  end

  # GET: /sown_items/5/edit
  get "/sown_items/:id/edit" do
    erb :"/sown_items/edit.html"
  end

  # PATCH: /sown_items/5
  patch "/sown_items/:id" do
    redirect "/sown_items/:id"
  end

  # DELETE: /sown_items/5/delete
  delete "/sown_items/:id/delete" do
    redirect "/sown_items"
  end
end
