require 'spec_helper'

describe ApplicationController do
  describe "GET '/'" do
    before(:context, logged_in: false) do
      get '/'
      if session[:rd]
        post '/logout'
      end
    end

    context 'not logged in', logged_in: false do
      it 'shows the welcome page' do
        visit '/'

        expect(page.body).to include('Welcome to the Seed, Time and Harvest Database!')
      end
    end

    context 'logged in', logged_in: false do
      it "redirects to '/index'" do
        user = User.create(username: 'test_user', email: 'test@email.com', password: 'password', logged_in: true)

        session[:rd] = user.id

        visit '/'
        
        fill_in :username_or_email, with: 'test_user'
        fill_in :password, with: 'password'
        click_button 'login'
        follow_redirect!

        visit '/'

        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_response.location).to include('/index')
      end
    end
  end
end