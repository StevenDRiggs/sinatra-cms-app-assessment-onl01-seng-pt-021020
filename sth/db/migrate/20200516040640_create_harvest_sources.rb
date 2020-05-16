class CreateHarvestSources < ActiveRecord::Migration
  def change
    create_table :harvest_sources do |t|
      t.integer :harvest_id
      t.integer :source_id
      t.timestamps null: false
    end
  end
end
