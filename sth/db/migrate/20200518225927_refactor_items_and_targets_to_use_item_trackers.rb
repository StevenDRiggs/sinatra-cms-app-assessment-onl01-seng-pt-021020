class RefactorItemsAndTargetsToUseItemTrackers < ActiveRecord::Migration
  def change
    remove_columns :items, :target_id, :sown
  end
end
