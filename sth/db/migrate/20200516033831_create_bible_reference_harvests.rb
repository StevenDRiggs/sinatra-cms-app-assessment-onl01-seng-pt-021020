class CreateBibleReferenceHarvests < ActiveRecord::Migration
  def change
    create_table :bible_reference_harvests do |t|
      t.integer :bible_reference_id
      t.integer :harvest_id
      t.timestamps null: false
    end
  end
end
