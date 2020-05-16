require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
use BibleReferencesController
use HarvestReceivedItemsController
use SeedSownItemsController
use HarvestSourcesController
use SeedToSowItemsController
use SeedTargetsController
use DesiresController
