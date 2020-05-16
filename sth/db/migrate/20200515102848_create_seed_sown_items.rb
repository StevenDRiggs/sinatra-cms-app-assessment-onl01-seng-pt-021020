class CreateSeedSownItems < ActiveRecord::Migration

  def change
    create_table :seed_sown_items do |t|
      t.integer :seed_target_id
      t.string :item
      t.timestamps
    end
  end

end
