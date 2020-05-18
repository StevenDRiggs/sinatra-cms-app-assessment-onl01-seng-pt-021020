class ChangeReceivedItemsItemToName < ActiveRecord::Migration
  def change
    rename_column :received_items, :item, :name
  end
end
