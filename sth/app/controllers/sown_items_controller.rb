class SownItemsController < ApplicationController

  # index
  get '/sown_items' do
    @sown_items = SownItem.all

    erb :'/sown_items/index.html'
  end
  
end
