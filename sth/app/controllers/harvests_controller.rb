class HarvestsController < ApplicationController

  # GET: /harvests
  get "/harvests" do
    erb :"/harvests/index.html"
  end

  # GET: /harvests/new
  get "/harvests/new" do
    erb :"/harvests/new.html"
  end

  # POST: /harvests
  post "/harvests" do
    redirect "/harvests"
  end

  # GET: /harvests/5
  get "/harvests/:id" do
    erb :"/harvests/show.html"
  end

  # GET: /harvests/5/edit
  get "/harvests/:id/edit" do
    erb :"/harvests/edit.html"
  end

  # PATCH: /harvests/5
  patch "/harvests/:id" do
    redirect "/harvests/:id"
  end

  # DELETE: /harvests/5/delete
  delete "/harvests/:id/delete" do
    redirect "/harvests"
  end
end
