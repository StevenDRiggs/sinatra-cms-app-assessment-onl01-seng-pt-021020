class ReformatTimeSownAndTimeToSowInTarget < ActiveRecord::Migration
  def change
    remove_column :targets, :time_sown
    remove_column :targets, :time_to_sow

    add_column :targets, :months_sown, :integer
    add_column :targets, :weeks_sown, :integer
    add_column :targets, :days_sown, :integer
    add_column :targets, :hours_sown, :integer
    add_column :targets, :minutes_sown, :integer

    add_column :targets, :months_to_sow, :integer
    add_column :targets, :weeks_to_sow, :integer
    add_column :targets, :days_to_sow, :integer
    add_column :targets, :hours_to_sow, :integer
    add_column :targets, :minutes_to_sow, :integer
  end
end
