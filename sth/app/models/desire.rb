class Desire < ActiveRecord::Base
  has_many :desire_seed_targets
  has_many :seed_targets, through: :desire_seed_targets
  has_many :seed_to_sow_items, through: :seed_targets
  has_many :sowed_items, through: :seed_targets

  has_many :desire_harvest_sources
  has_many :harvest_received_items, through: :harvest_received_items
end
