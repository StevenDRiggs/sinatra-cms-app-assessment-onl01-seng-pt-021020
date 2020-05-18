class HarvestsController < ApplicationController

  get "/harvests" do
    @harvests = Harvest.all

    erb :"/harvests/index.html"
  end

  get "/harvests/:id" do
    @harvest = Harvest.find_by_id(params[:id])

    erb :"/harvests/show.html"
  end

end
