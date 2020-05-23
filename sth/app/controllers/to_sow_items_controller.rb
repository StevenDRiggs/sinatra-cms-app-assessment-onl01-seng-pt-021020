class ToSowItemsController < ApplicationController

  # index
  get '/to_sow_items' do
    @to_sow_items = ToSowItem.all

    erb :'/to_sow_items/index.html'
  end

  # new
  get '/to_sow_items/new' do
    @targets = Target.all

    erb :'/to_sow_items/new.html'
  end

  post '/to_sow_items' do
    to_sow_item = ToSowItem.create(item: params[:item], target: Target.find_by_id(params[:target]))

    redirect "/to_sow_items/#{to_sow_item.id}"
  end

  # show
  get '/to_sow_items/:id' do
    @to_sow_item = ToSowItem.find_by_id(params[:id])

    erb :'/to_sow_items/show.html'
  end

  # edit
  get '/to_sow_items/:id/edit' do
    @to_sow_item = ToSowItem.find_by_id(params[:id])
    @targets = Target.all

    erb :'/to_sow_items/edit.html'
  end

  patch '/to_sow_items/:id' do
    to_sow_item = ToSowItem.find_by_id(params[:id])
    if to_sow_item
      to_sow_item.item = params[:item]
      to_sow_item.target = Target.find_by_id(params[:target])

      to_sow_item.save

      redirect "/to_sow_items/#{to_sow_item.id}"
    end

    redirect '/to_sow_items/new'
  end

  # delete
  get '/to_sow_items/:id/delete' do
    @to_sow_item = ToSowItem.find_by_id(params[:id])

    erb :'/to_sow_items/delete.html'
  end

  delete '/to_sow_items/:id' do
    ToSowItem.find_by_id(params[:id]).delete

    redirect '/to_sow_items'
  end

end
