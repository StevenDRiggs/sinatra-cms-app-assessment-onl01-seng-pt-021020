ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL

  config.order = 'default'
end

def app
  Rack::Builder.parse_file('config.ru').first
end

def session
  last_request.env['rack.session']
end

Capybara.app = app

BibleReferenceDesire.destroy_all
BibleReferenceHarvest.destroy_all
BibleReferenceSeed.destroy_all
BibleReference.destroy_all
Desire.destroy_all
HarvestSource.destroy_all
Harvest.destroy_all
ReceivedItem.destroy_all
SeedTarget.destroy_all
Seed.destroy_all
Source.destroy_all
SownItem.destroy_all
Target.destroy_all
ToSowItem.destroy_all
User.destroy_all