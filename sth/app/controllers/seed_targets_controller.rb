class SeedTargetsController < ApplicationController

  # GET: /seed_targets
  get "/seed_targets" do
    erb :"/seed_targets/index.html"
  end

  # GET: /seed_targets/new
  get "/seed_targets/new" do
    erb :"/seed_targets/new.html"
  end

  # POST: /seed_targets
  post "/seed_targets" do
    redirect "/seed_targets"
  end

  # GET: /seed_targets/5
  get "/seed_targets/:id" do
    erb :"/seed_targets/show.html"
  end

  # GET: /seed_targets/5/edit
  get "/seed_targets/:id/edit" do
    erb :"/seed_targets/edit.html"
  end

  # PATCH: /seed_targets/5
  patch "/seed_targets/:id" do
    redirect "/seed_targets/:id"
  end

  # DELETE: /seed_targets/5/delete
  delete "/seed_targets/:id/delete" do
    redirect "/seed_targets"
  end
end
