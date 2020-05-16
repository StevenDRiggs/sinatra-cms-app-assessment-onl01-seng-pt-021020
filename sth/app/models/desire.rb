class Desire < ActiveRecord::Base
  has_many :bible_reference_desires
  has_many :bible_references, through: :bible_reference_desires
end
