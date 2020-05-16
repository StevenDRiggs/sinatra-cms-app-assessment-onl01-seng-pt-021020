class CreateSeedToSowItems < ActiveRecord::Migration

  def change
    create_table :seed_to_sow_items do |t|
      t.integer :seed_target_id
      t.string :item
      t.timestamps
    end
  end

end
