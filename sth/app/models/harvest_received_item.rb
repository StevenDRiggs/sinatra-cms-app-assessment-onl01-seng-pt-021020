class HarvestReceivedItem < ActiveRecord::Base
  belongs_to :harvest_source
end
