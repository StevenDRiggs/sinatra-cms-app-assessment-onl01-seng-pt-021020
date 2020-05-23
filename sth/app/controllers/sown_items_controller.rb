class SownItemsController < ApplicationController

  # index
  get '/sown_items' do
    @sown_items = SownItem.all

    erb :'/sown_items/index.html'
  end

  # new
  get '/sown_items/new' do
    @targets = Target.all

    erb :'/sown_items/new.html'
  end

  post '/sown_items' do
    sown_item = SownItem.create(item: params[:item], target: Target.find_by_id(params[:target]))

    redirect "/sown_items/#{sown_item.id}"
  end

  # show
  get '/sown_items/:id' do
    @sown_item = SownItem.find_by_id(params[:id])

    erb :'/sown_items/show.html'
  end

end
