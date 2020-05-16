require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'my_secret'
  end


  helpers do

    def logged_in?(user_id)
      !session[:user_id].nil?
    end

  end


  get '/' do
    if logged_in?(session[:user_id])
      redirect '/index'
    end

    erb :welcome
  end

  get '/signup' do
    if logged_in?(session[:user_id])
      redirect '/index'
    end

    erb :signup
  end

  post '/signup' do
    if params[:username] != '' && params[:email] != '' && params[:password] != ''
      if !User.find_by(username: params[:username]) && !User.find_by(email: params[:email])
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        redirect '/index'
      else
        redirect '/signup'
      end
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?(session[:user_id])
      redirect '/index'
    end

    erb :login
  end

  get '/index' do
    if !logged_in?(session[:user_id])
      redirect '/'
    end

    erb :index
  end

end
