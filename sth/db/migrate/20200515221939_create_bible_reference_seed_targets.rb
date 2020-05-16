class CreateBibleReferenceSeedTargets < ActiveRecord::Migration

  def change
    create_table :bible_reference_seed_targets do |t|
      t.integer :bible_reference_id
      t.integer :seed_target_id
    end
  end

end
