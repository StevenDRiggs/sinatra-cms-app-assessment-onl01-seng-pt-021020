class SetDefaultsForHarvestsCompleted < ActiveRecord::Migration
  def up
    change_column_default :harvests, :completed, false
  end

  def down
    change_column_default :harvests, :completed, nil
  end
end
