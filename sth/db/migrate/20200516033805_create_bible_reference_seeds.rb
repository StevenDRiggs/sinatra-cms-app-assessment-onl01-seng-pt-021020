class CreateBibleReferenceSeeds < ActiveRecord::Migration
  def change
    create_table :bible_reference_seeds do |t|
      t.integer :bible_reference_id
      t.integer :seed_id
      t.timestamps null: false
    end
  end
end
