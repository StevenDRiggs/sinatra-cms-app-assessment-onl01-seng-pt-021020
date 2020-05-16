class SeedTarget < ActiveRecord::Base
  has_many :desire_seed_targets
  has_many :desires, through: :desire_seed_targets
  has_many :harvest_sources, through: :desires

  has_many :seed_sown_items
  has_many :seed_to_sow_items

  has_many :bible_reference_seed_targets
  has_many :bible_references, through: :bible_reference_seed_targets
end
