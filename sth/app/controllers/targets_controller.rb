class TargetsController < ApplicationController

  # index
  get '/targets' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    @user = User.find_by_id(session[:rd])

    erb :'/targets/index.html'
  end

  # new
  get '/targets/new' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to create data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @items = user.sown_items + user.to_sow_items

    erb :'/targets/new.html'
  end

  post '/targets' do
    user = User.find_by_id(session[:rd])
    target = user.targets.build(name: params[:name])
    target.time_sown = "#{params[:months_sown]} months, #{params[:weeks_sown]} weeks, #{params[:days_sown]} days, #{params[:hours_sown]} hours, #{params[:minutes_sown]} minutes"
    target.money_sown = params[:money_sown].to_f
    target.time_to_sow = "#{params[:months_to_sow]} months, #{params[:weeks_to_sow]} weeks, #{params[:days_to_sow]} days, #{params[:hours_to_sow]} hours, #{params[:minutes_to_sow]} minutes"
    target.money_to_sow = params[:money_to_sow].to_f
    target.sown_items << user.sown_items.build(item: params[:new_sown_item]) if params[:new_sown_item] != ''
    target.to_sow_items << user.to_sow_items.build(item: params[:new_to_sow_item]) if params[:new_to_sow_item] != ''

    if !(params[:sown_items].nil? || (params[:sown_items].length == 1 && params[:sown_items][0] == ''))
      for sown_item in params[:sown_items]
        which, id = sown_item.split('-')
        case which
        when 'sown_item'
          target.sown_items << SownItem.find_by(user_id: user.id, id: id)
        when 'to_sow_item'
          item = !SownItem.find_by(user_id: user.id, item: ToSowItem.find_by(user_id: user.id, id: id).item).nil? ? SownItem.find_by(user_id: user.id, item: ToSowItem.find_by(user_id: user.id, id: id).item) : user.sown_items.build(item: ToSowItem.find_by(user_id: user.id, id: id).item)
          target.sown_items << item
        end
      end
    end

    if !(params[:to_sow_items].nil? || (params[:to_sow_items].length == 1 && params[:to_sow_items][0] == ''))
      for to_sow_item in params[:to_sow_items]
        which, id = to_sow_item.split('-')
        case which
        when 'sown_item'
          item = !ToSowItem.find_by(user_id: user.id, item: SownItem.find_by(user_id: user.id, id: id).item).nil? ? ToSowItem.find_by(user_id: user.id, item: SownItem.find_by(user_id: user.id, id: id).item) : user.to_sow_items.build(item: SownItem.find_by(user_id: user.id, id: id).item)
          target.to_sow_items << item
        when 'to_sow_item'
          target.to_sow_items << ToSowItem.find_by(user_id: user.id, id: id)
        end
      end
    end

    target.save

    redirect '/seeds/new'
  end

  # show
  get '/targets/:id' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @target = Target.find_by(user_id: user.id, id: params[:id])
    @bible_references = @target.seeds.select {|seed| seed.user_id == user.id}.collect {|seed| seed.bible_references}.flatten.select {|bible_reference| bible_reference.user_id == user.id}.uniq
    @desires = @bible_references.collect {|bible_reference| bible_reference.desires}.flatten.select {|desire| desire.user_id == user.id}.uniq
    @sources = @bible_references.collect {|bible_reference| bible_reference.harvests}.flatten.uniq.select {|harvest| harvest.user_id == user.id}.collect {|harvest| harvest.sources}.flatten.uniq.select {|source| source.user_id == user.id}

    erb :'/targets/show.html'
  end

  # edit
  get '/targets/:id/edit' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to edit stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @target = Target.find_by(user_id: user.id, id: params[:id])
    @items = user.sown_items + user.to_sow_items

    erb :'/targets/edit.html'
  end

  patch '/targets/:id' do
    user = User.find_by_id(session[:rd])
    target = Target.find_by(user_id: user.id, id:params[:id])
    target.name = params[:name]
    target.time_sown = "#{params[:months_sown]} months, #{params[:weeks_sown]} weeks, #{params[:days_sown]} days, #{params[:hours_sown]} hours, #{params[:minutes_sown]} minutes"
    target.money_sown = params[:money_sown].to_f
    target.time_to_sow = "#{params[:months_to_sow]} months, #{params[:weeks_to_sow]} weeks, #{params[:days_to_sow]} days, #{params[:hours_to_sow]} hours, #{params[:minutes_to_sow]} minutes"
    target.money_to_sow = params[:money_to_sow].to_f

    target.sown_items = []
    target.to_sow_items = []

    target.sown_items << user.sown_items.build(item: params[:new_sown_item]) if !(params[:new_sown_item].nil? || params[:new_sown_item] == '')
    target.to_sow_items << user.to_sow_items.build(item: params[:new_to_sow_item]) if !(params[:new_to_sow_item].nil? || params[:new_to_sow_item] == '')

    if !(params[:sown_items].nil? || (params[:sown_items].length == 1 && params[:sown_items][0] == ''))
      for sown_item in params[:sown_items]
        which, id = sown_item.split('-')
        case which
        when 'sown_item'
          target.sown_items << SownItem.find_by(user_id: user.id, id: id)
        when 'to_sow_item'
          item = !SownItem.find_by(user_id: user.id, item: ToSowItem.find_by(user_id: user.id, id: id).item).nil? ? SownItem.find_by(user_id: user.id, item: ToSowItem.find_by(user_id: user.id, id: id).item) : user.sown_items.build(item: ToSowItem.find_by(user_id: user.id, id: id).item)
          target.sown_items << item
        end
      end
    end

    if !(params[:to_sow_items].nil? || (params[:to_sow_items].length == 1 && params[:to_sow_items][0] == ''))
      for to_sow_item in params[:to_sow_items]
        which, id = to_sow_item.split('-')
        case which
        when 'sown_item'
          item = !ToSowItem.find_by(user_id: user.id, item: SownItem.find_by(user_id: user.id, id: id).item).nil? ? ToSowItem.find_by(user_id: user.id, item: SownItem.find_by(user_id: user.id, id: id).item) : user.to_sow_items.build(item: SownItem.find_by(user_id: user.id, id: id).item)
          target.to_sow_items << item
        when 'to_sow_item'
          target.to_sow_items << ToSowItem.find_by(user_id: user.id, id: id)
        end
      end
    end

    target.save

    redirect "/targets/#{target.id}"
  end

  # delete
  get '/targets/:id/delete' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to delete stored data."
      redirect '/'
    end

    user = User.find_by_id(session[:rd])
    @target = Target.find_by(user_id: user.id, id: params[:id])

    erb :'/targets/delete.html'
  end

  delete '/targets/:id' do
    user = User.find_by_id(session[:rd])
    Target.find_by(user_id: user.id, id: params[:id]).delete

    redirect :'/targets'
  end

end
