class CreateToSowItems < ActiveRecord::Migration
  def change
    create_table :to_sow_items do |t|
      t.integer :target_id
      t.string :item
      t.timestamps null: false
    end
  end
end
