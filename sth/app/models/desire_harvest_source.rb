class DesireHarvestSource < ActiveRecord::Base
  belongs_to :desire
  belongs_to :harvest_source
end
