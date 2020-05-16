class BibleReferenceDesire < ActiveRecord::Base
  belongs_to :bible_reference
  belongs_to :desire
end
