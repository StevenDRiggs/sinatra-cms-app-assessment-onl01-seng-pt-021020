class TargetsController < ApplicationController

  # new
  get '/targets/new' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @items = (SownItem.all + ToSowItem.all).uniq

    erb :'/targets/new.html'
  end

  post '/targets' do
    if params[:name] != ''
      target = Target.new(name: params[:name])
      target.time_sown = "#{params[:months_sown]} months, #{params[:weeks_sown]} weeks, #{params[:days_sown]} days, #{params[:hours_sown]} hours, #{params[:minutes_sown]} minutes"
      target.money_sown = params[:money_sown].to_f
      target.time_to_sow = "#{params[:months_to_sow]} months, #{params[:weeks_to_sow]} weeks, #{params[:days_to_sow]} days, #{params[:hours_to_sow]} hours, #{params[:minutes_to_sow]} minutes"
      target.money_to_sow = params[:money_to_sow].to_f
      target.sown_items << SownItem.create(item: params[:new_sown_item]) if params[:new_sown_item] != ''
      target.to_sow_items << ToSowItem.create(item: params[:new_to_sow_item]) if params[:new_to_sow_item] != ''

      for sown_item in params[:sown_items]
        which, id = sown_item.split('-')
        case which
        when 'sown_item'
          target.sown_items << SownItem.find_by_id(id.to_i)
        when 'to_sow_item'
          item = !SownItem.find_by(item: ToSowItem.find_by_id(id.to_i).item).nil? ? SownItem.find_by(item: ToSowItem.find_by_id(id.to_i).item) : SownItem.create(item: ToSowItem.find_by_id(id.to_i).item)
          target.sown_items << item
        end
      end

      for to_sow_item in params[:to_sow_items]
        which, id = to_sow_item.split('-')
        case which
        when 'sown_item'
          item = !ToSowItem.find_by(item: SownItem.find_by_id(id.to_i).item).nil? ? ToSowItem.find_by(item: SownItem.find_by_id(id.to_i).item) : ToSowItem.create(item: SownItem.find_by_id(id.to_i).item)
          target.to_sow_items << item
        when 'to_sow_item'
          target.to_sow_items << ToSowItem.find_by_id(id.to_i)
        end
      end

      target.save

      redirect '/bible_references/new'
    end
  end

  # show
  get '/targets/:id' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @target = Target.find_by_id(params[:id])
    @bible_references = @target.seeds.collect {|seed| seed.bible_references}.flatten.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.uniq
    @sources = @bible_references.collect {|bible_reference| bible_reference.harvests}.flatten.uniq.collect {|harvest| harvest.sources}.flatten.uniq

    erb :'/targets/show.html'
  end

  # delete
  get '/targets/:id/delete' do
    @target = Target.find_by_id(params[:id])

    erb :'/targets/delete.html'
  end

  delete '/targets/:id' do
    Target.find_by_id(params[:id]).delete

    redirect :'/targets'
  end

end