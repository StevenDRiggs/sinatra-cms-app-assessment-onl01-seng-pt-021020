class MakeSownItemsItemNotNullable < ActiveRecord::Migration
  def change
    change_column_null :sown_items, :item, false
  end
end
