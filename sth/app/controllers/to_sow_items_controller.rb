class ToSowItemsController < ApplicationController

  # GET: /to_sow_items
  get "/to_sow_items" do
    erb :"/to_sow_items/index.html"
  end

  # GET: /to_sow_items/new
  get "/to_sow_items/new" do
    erb :"/to_sow_items/new.html"
  end

  # POST: /to_sow_items
  post "/to_sow_items" do
    redirect "/to_sow_items"
  end

  # GET: /to_sow_items/5
  get "/to_sow_items/:id" do
    erb :"/to_sow_items/show.html"
  end

  # GET: /to_sow_items/5/edit
  get "/to_sow_items/:id/edit" do
    erb :"/to_sow_items/edit.html"
  end

  # PATCH: /to_sow_items/5
  patch "/to_sow_items/:id" do
    redirect "/to_sow_items/:id"
  end

  # DELETE: /to_sow_items/5/delete
  delete "/to_sow_items/:id/delete" do
    redirect "/to_sow_items"
  end
end
