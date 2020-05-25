require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'my_secret'
    register Sinatra::Flash
  end


  helpers do

    def logged_in?(user_id)
      !session[:rd].nil? && User.find_by_id(session[:rd]) && User.find_by_id(session[:rd]).logged_in
    end

  end


  # welcome
  get '/' do
    if logged_in?(session[:rd])
      redirect '/index'
    end

    erb :'/welcome.html'
  end

  # signup
  get '/signup' do
    if logged_in?(session[:rd])
      redirect '/index'
    end

    erb :'/signup.html'
  end

  post '/signup' do
    if !User.find_by(username: params[:username]) && !User.find_by(email: params[:email])
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
      user.logged_in = true
      session[:rd] = user.id
      redirect '/index'
    else
      flash[:error] = "Username or Email already exists."
      redirect '/signup'
    end
  end

  # login
  get '/login' do
    if logged_in?(session[:rd])
      redirect '/index'
    end

    erb :'/login.html'
  end

  post '/login' do
    user = params[:username_or_email].match?(/.*@.*\.[a-zA-Z]{3,5}/) ? User.find_by(email: params[:username_or_email]) : User.find_by(username: params[:username_or_email])
    if user && user.authenticate(params[:password])
      user.logged_in = true
      session[:rd] = user.id
      redirect '/index'
    else
      flash[:error] = "Username/Email and Password combination incorrect."
      redirect '/login'
    end
  end

  # logout
  get '/logout' do
    if !logged_in?(session[:rd])
      redirect '/'
    end

    @username = User.find_by_id(session[:rd]).username

    erb :'/logout.html'
  end

  post '/logout' do
    User.find_by_id(session[:rd]).logged_in = false
    session.clear

    redirect '/'
  end

  # index (logged in)
  get '/index' do
    if !logged_in?(session[:rd])
      flash[:warning] = "You must be logged in to view stored data."
      redirect '/'
    else
      @user = User.find_by_id(session[:rd])

      erb :'/index.html'
    end
  end

end
