class BibleReferencesController < ApplicationController

  # GET: /bible_references
  get "/bible_references" do
    erb :"/bible_references/index.html"
  end

  # GET: /bible_references/new
  get "/bible_references/new" do
    erb :"/bible_references/new.html"
  end

  # POST: /bible_references
  post "/bible_references" do
    redirect "/bible_references"
  end

  # GET: /bible_references/5
  get "/bible_references/:id" do
    erb :"/bible_references/show.html"
  end

  # GET: /bible_references/5/edit
  get "/bible_references/:id/edit" do
    erb :"/bible_references/edit.html"
  end

  # PATCH: /bible_references/5
  patch "/bible_references/:id" do
    redirect "/bible_references/:id"
  end

  # DELETE: /bible_references/5/delete
  delete "/bible_references/:id/delete" do
    redirect "/bible_references"
  end
end
