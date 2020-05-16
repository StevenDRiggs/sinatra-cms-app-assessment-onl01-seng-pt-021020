class BibleReferenceHarvest < ActiveRecord::Base
  belongs_to :bible_reference
  belongs_to :harvest
end
