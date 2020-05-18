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

    erb :"welcome.html"
  end

  get '/signup' do
    if logged_in?(session[:user_id])
      redirect '/index'
    end

    erb :"signup.html"
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

    erb :"login.html"
  end

  post '/login' do
    if params[:username_or_email] != '' && params[:password] != ''
      user = params[:username_or_email].match?(/.*@.*\.[a-zA-Z]{3,5}/) ? User.find_by(email: params[:username_or_email]) : User.find_by(username: params[:username_or_email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/index'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  get '/logout' do
    @username = User.find_by_id(session[:user_id]).username

    erb :"logout.html"
  end

  post '/logout' do
    session.clear

    redirect '/'
  end

  get '/index' do
    if !logged_in?(session[:user_id])
      redirect '/'
    else
      @desires = Desire.all

      erb :"index.html"
    end
  end

end
