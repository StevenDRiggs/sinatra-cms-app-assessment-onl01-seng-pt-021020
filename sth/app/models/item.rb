class Item < ActiveRecord::Base
  has_many :item_trackers
  has_many :targets, through: :item_trackers

  accepts_nested_attributes_for :item_trackers
end
