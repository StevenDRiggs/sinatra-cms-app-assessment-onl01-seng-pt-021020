class CreateHarvestReceivedItems < ActiveRecord::Migration

  def change
    create_table :harvest_received_items do |t|
      t.integer :harvest_source_id
      t.string :item
      t.timestamps
    end
  end

end
