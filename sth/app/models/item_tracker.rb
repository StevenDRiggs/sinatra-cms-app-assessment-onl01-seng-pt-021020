class ItemTracker < ActiveRecord::Base
  belongs_to :target
  belongs_to :item
end
