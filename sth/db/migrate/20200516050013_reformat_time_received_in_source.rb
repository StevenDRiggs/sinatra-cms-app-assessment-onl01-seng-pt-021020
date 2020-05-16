class ReformatTimeReceivedInSource < ActiveRecord::Migration
  def change
    remove_column :sources, :time_received

    add_column :sources, :months_received, :integer
    add_column :sources, :weeks_received, :integer
    add_column :sources, :days_received, :integer
    add_column :sources, :hours_received, :integer
    add_column :sources, :minutes_received, :integer
  end
end
