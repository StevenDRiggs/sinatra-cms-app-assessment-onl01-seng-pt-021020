class BibleReferenceSeed < ActiveRecord::Base
  belongs_to :bible_reference
  belongs_to :seed
end
