class CreateSeedSowedItems < ActiveRecord::Migration

  def change
    create_table :seed_sowed_items do |t|
      t.integer :seed_target_id
      t.string :item
    end
  end

end
