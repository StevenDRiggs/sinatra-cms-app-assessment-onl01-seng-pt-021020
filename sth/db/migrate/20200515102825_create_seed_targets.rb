class CreateSeedTargets < ActiveRecord::Migration

  def change
    create_table :seed_targets do |t|
      t.string :target
      t.decimal :money_sown
      t.decimal :money_to_sow
      t.timestamps
    end
  end

end
