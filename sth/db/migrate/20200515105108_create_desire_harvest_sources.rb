class CreateDesireHarvestSources < ActiveRecord::Migration

  def change
    create_table :desire_harvest_sources do |t|
      t.integer :desire_id
      t.integer :harvest_source_id
    end
  end

end
