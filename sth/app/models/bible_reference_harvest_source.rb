class BibleReferenceHarvestSource < ActiveRecord::Base
  belongs_to :bible_reference
  belongs_to :harvest_source
end
