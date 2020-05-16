class CreateSeedTargets < ActiveRecord::Migration
  def change
    create_table :seed_targets do |t|
      t.integer :seed_id
      t.integer :target_id
      t.timestamps null: false
    end
  end
end
