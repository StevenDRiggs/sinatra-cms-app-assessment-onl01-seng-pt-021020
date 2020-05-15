class CreateDesireSeedTargets < ActiveRecord::Migration

  def change
    create_table :desire_seed_targets do |t|
      t.integer :desire_id
      t.integer :seed_target_id
    end
  end

end
