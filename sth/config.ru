require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use ReceivedItemsController
use SourcesController
use TargetsController
use ToSowItemsController
use SownItemsController
use HarvestsController
use SeedsController
use BibleReferencesController
use DesiresController
