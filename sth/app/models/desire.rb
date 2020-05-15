class Desire < ActiveRecord::Base
  has_many :desire_seed_targets
  has_many :seed_targets, through: :desire_seed_targets
  has_many :seed_to_sow_items, through: :seed_targets
  has_many :seed_sown_items, through: :seed_targets

  has_many :desire_harvest_sources
  has_many :harvest_sources, through: :desire_harvest_sources
  has_many :harvest_received_items, through: :harvest_sources
end
