class SetDefaultsForHarvestsCompleted < ActiveRecord::Migration
  def change
    change_column_default :harvests, :completed, from: nil, to: false
  end
end
