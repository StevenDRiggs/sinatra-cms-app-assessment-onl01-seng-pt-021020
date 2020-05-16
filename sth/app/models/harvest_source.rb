class HarvestSource < ActiveRecord::Base
  belongs_to :harvest
  belongs_to :source
end
