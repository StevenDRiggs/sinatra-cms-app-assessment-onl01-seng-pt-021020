class SetDefaultsForSourcesMoneyReceivedAndTimeReceived < ActiveRecord::Migration
  def change
    change_column_default :sources, :money_received, from: nil, to: 0
    
    change_column_default :sources, :minutes_received, from: nil, to: 0
    change_column_default :sources, :hours_received, from: nil, to: 0
    change_column_default :sources, :days_received, from: nil, to: 0
    change_column_default :sources, :weeks_received, from: nil, to: 0
    change_column_default :sources, :months_received, from: nil, to: 0
  end
end
