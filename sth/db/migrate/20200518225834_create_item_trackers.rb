class CreateItemTrackers < ActiveRecord::Migration
  def change
    create_table :item_trackers do |t|
      t.integer :target_id
      t.integer :item_id
      t.boolean :sown, null: false, default: false
      t.integer :quantity, null: false, default: 0
    end
  end
end
