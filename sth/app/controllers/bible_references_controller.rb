class BibleReferencesController < ApplicationController

  get "/bible_references" do
    @bible_references = BibleReference.all

    erb :"/bible_references/index.html"
  end

  get "/bible_references/:id" do
    @bible_reference = BibleReference.find_by_id(params[:id])

    erb :"/bible_references/show.html"
  end

end
