class ReceivedItemsController < ApplicationController

  # index
  get '/received_items' do
    @received_items = ReceivedItem.all

    erb :'/received_items/index.html'
  end

end
