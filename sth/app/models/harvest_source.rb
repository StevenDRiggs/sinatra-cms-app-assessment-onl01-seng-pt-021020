class HarvestSource < ActiveRecord::Base
  has_many :desire_harvest_sources
  has_many :desires, through: :desire_harvest_sources
  has_many :seed_targets, through: :desires

  has_many :harvest_received_items

  has_many :bible_reference_harvest_sources
  has_many :bible_references, through: :bible_reference_harvest_sources
end
