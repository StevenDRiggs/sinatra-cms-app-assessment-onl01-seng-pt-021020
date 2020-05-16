class CreateReceivedItems < ActiveRecord::Migration
  def change
    create_table :received_items do |t|
      t.integer :source_id
      t.string :item
      t.timestamps null: false
    end
  end
end
