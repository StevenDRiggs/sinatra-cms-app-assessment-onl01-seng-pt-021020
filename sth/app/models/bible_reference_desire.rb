class BibleReferenceDesire < ActiveRecord::Base
  belongs_to :user

  belongs_to :bible_reference
  belongs_to :desire
end
