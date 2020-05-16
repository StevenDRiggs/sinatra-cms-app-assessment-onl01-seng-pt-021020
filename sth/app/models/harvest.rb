class Harvest < ActiveRecord::Base
  has_many :bible_reference_harvests
  has_many :bible_references, through: :bible_reference_harvests

  has_many :harvest_sources
  has_many :sources, through: :harvest_sources
end
