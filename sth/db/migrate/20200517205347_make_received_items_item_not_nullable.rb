class MakeReceivedItemsItemNotNullable < ActiveRecord::Migration
  def change
    change_column_null :received_items, :item, false
  end
end
