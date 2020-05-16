class BibleReference < ActiveRecord::Base
  has_many :desire_bible_references
  has_many :desires, through: :desire_bible_references

  has_many :bible_reference_seed_targets
  has_many :seed_targets, through: :bible_reference_seed_targets

  has_many :bible_reference_harvest_sources
  has_many :harvest_sources, through: :bible_reference_harvest_sources
end
