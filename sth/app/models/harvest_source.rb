class HarvestSource < ActiveRecord::Base
  has_many :desire_harvest_sources
  has_many :desires, through: :desire_harvest_sources

  has_many :harvest_received_items
end
