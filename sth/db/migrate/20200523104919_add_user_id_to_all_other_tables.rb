class AddUserIdToAllOtherTables < ActiveRecord::Migration
  def change
    add_column :bible_reference_desires, :user_id, :integer, null: false, default: -1
    add_column :bible_reference_harvests, :user_id, :integer, null: false, default: -1
    add_column :bible_reference_seeds, :user_id, :integer, null: false, default: -1
    add_column :bible_references, :user_id, :integer, null: false, default: -1
    add_column :desires, :user_id, :integer, null: false, default: -1
    add_column :harvest_sources, :user_id, :integer, null: false, default: -1
    add_column :harvests, :user_id, :integer, null: false, default: -1
    add_column :received_items, :user_id, :integer, null: false, default: -1
    add_column :seed_targets, :user_id, :integer, null: false, default: -1
    add_column :seeds, :user_id, :integer, null: false, default: -1
    add_column :sources, :user_id, :integer, null: false, default: -1
    add_column :sown_items, :user_id, :integer, null: false, default: -1
    add_column :targets, :user_id, :integer, null: false, default: -1
    add_column :to_sow_items, :user_id, :integer, null: false, default: -1
  end
end
