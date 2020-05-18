class DesiresController < ApplicationController

  get "/desires" do
    @desires = Desire.all

    erb :"/desires/index.html"
  end

  get "/desires/new" do
    erb :"desires/new.html"
  end

  get "/desires/:id" do
    @desire = Desire.find_by_id(params[:id])

    erb :"/desires/show.html"
  end

end
