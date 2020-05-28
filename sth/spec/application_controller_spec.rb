require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  context "root page" do
    it "responds with a welcome message" do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Welcome to the Seed, Time and Harvest Database!")
    end

    it "contains signup link" do
      get '/'
      expect(last_response.body).to include('<a href="/signup">Sign Up</a>')
    end

    it "contains login link" do
      get '/'
      expect(last_response.body).to include('<a href="/login">Log In</a>')
    end

    it "requires login to view index" do
      get '/index'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include("You must be logged in to view stored data")
    end
  end

  context "signup page" do
    it "properly displays page" do
    end
  end
end
