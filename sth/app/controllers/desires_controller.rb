class DesiresController < ApplicationController

  # GET: /desires
  get "/desires" do
    erb :"/desires/index.html"
  end

  # GET: /desires/new
  get "/desires/new" do
    erb :"/desires/new.html"
  end

  # POST: /desires
  post "/desires" do
    redirect "/desires"
  end

  # GET: /desires/5
  get "/desires/:id" do
    @desire = Desire.find_by_id(params[:id])

    erb :"/desires/show.html"
  end

  # GET: /desires/5/edit
  get "/desires/:id/edit" do
    erb :"/desires/edit.html"
  end

  # PATCH: /desires/5
  patch "/desires/:id" do
    redirect "/desires/:id"
  end

  # DELETE: /desires/5/delete
  delete "/desires/:id/delete" do
    redirect "/desires"
  end
end
