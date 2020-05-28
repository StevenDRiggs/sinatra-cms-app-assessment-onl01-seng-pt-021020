require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to the Seed, Time and Harvest Database!")
  end

  it "requires login to view index" do
    get '/index'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response.body).to include("You must be logged in to view stored data")
  end
end
