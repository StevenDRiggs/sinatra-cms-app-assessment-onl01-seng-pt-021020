class CreateHarvestSources < ActiveRecord::Migration

  def change
    create_table :harvest_sources do |t|
      t.string :source
      t.decimal :money_received
      t.timestamps
    end
  end

end
