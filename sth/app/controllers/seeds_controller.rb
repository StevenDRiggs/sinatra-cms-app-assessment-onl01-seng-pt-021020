class SeedsController < ApplicationController

  get "/seeds" do
    @seeds = Seed.all

    erb :"/seeds/index.html"
  end

  get "/seeds/:id" do
    @seed = Seed.find_by_id(params[:id])

    erb :"/seeds/show.html"
  end

end
