class Seed < ActiveRecord::Base
  has_many :bible_reference_seeds
  has_many :bible_references, through: :bible_reference_seeds

  has_many :seed_targets
  has_many :targets, through: :seed_targets
end
