class CreateBibleReferenceHarvestSources < ActiveRecord::Migration

  def change
    create_table :bible_reference_harvest_sources do |t|
      t.integer :bible_reference_id
      t.integer :harvest_source_id
    end
  end

end
