class SetDefaultsForTargetsMoneySownMoneyToSowAndTimeSown < ActiveRecord::Migration
  def change
    change_column_default :targets, :money_sown, from: nil, to: 0

    change_column_default :targets, :money_to_sow, from: nil, to: 0

    change_column_default :targets, :minutes_sown, from: nil, to: 0
    change_column_default :targets, :hours_sown, from: nil, to: 0
    change_column_default :targets, :days_sown, from: nil, to: 0
    change_column_default :targets, :weeks_sown, from: nil, to: 0
    change_column_default :targets, :months_sown, from: nil, to: 0

    change_column_default :targets, :minutes_to_sow, from: nil, to: 0
    change_column_default :targets, :hours_to_sow, from: nil, to: 0
    change_column_default :targets, :days_to_sow, from: nil, to: 0
    change_column_default :targets, :weeks_to_sow, from: nil, to: 0
    change_column_default :targets, :hours_to_sow, from: nil, to: 0
  end
end
