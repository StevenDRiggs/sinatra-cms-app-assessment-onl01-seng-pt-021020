class DesireBibleReference < ActiveRecord::Base
  belongs_to :desire
  belongs_to :bible_reference
end
