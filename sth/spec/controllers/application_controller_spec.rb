require 'spec_helper'

describe ApplicationController do
  describe "GET '/'" do
    before(:context) do
      get '/'
      if session[:rd]
        post '/logout'
      end
    end

    context 'not logged in' do
      it 'shows the welcome page' do
        visit '/'

        expect(page.body).to include('Welcome to the Seed, Time and Harvest Database!')
      end
    end
  end
end