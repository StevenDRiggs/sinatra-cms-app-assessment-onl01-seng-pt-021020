class BibleReferenceSeedTarget < ActiveRecord::Base
  belongs_to :bible_reference
  belongs_to :seed_target
end
