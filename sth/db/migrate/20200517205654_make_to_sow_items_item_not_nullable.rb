class MakeToSowItemsItemNotNullable < ActiveRecord::Migration
  def change
    change_column_null :to_sow_items, :item, false
  end
end
