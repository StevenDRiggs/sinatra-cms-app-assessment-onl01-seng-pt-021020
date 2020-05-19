class BibleReference < ActiveRecord::Base
  has_many :bible_reference_desires
  has_many :desires, through: :bible_reference_desires

  has_many :bible_reference_seeds
  has_many :seeds, through: :bible_reference_seeds
  has_many :seed_targets, through: :seeds
  has_many :targets, through: :seed_targets
  has_many :sown_items, through: :targets
  has_many :to_sow_items, through: :targets

  has_many :bible_reference_harvests
  has_many :harvests, through: :bible_reference_harvests
  has_many :harvest_sources, through: :harvests
  has_many :sources, through: :harvest_sources
  has_many :received_items, through: :sources
end
