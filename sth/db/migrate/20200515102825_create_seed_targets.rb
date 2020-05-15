class CreateSeedTargets < ActiveRecord::Migration

  def change
    create_table :seed_targets do |t|
      t.string :target
      t.numeric :money_sowed
      t.numeric :money_to_sow
    end
  end

end
