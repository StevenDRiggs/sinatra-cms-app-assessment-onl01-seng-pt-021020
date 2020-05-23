class Desire < ActiveRecord::Base
  belongs_to :user

  has_many :bible_reference_desires
  has_many :bible_references, through: :bible_reference_desires
  
  has_many :bible_reference_seeds, through: :bible_references
  has_many :seeds, through: :bible_reference_seeds

  has_many :bible_reference_harvests, through: :bible_references
  has_many :harvests, through: :bible_reference_harvests
end
