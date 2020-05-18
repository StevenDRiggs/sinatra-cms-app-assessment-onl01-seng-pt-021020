class ReplaceSownItemsAndToSowItemsWithItems < ActiveRecord::Migration
  def change
    drop_table :to_sow_items
    drop_table :sown_items

    create_table :items do |t|
      t.integer :target_id
      t.string :name, null: false
      t.boolean :sown, default: false
      t.timestamps
    end
  end
end
