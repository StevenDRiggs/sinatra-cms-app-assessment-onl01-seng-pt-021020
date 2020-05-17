class AddCompletedAndTimeToCompletionToHarvests < ActiveRecord::Migration
  def change
    add_column :harvests, :completed, :boolean

    add_column :harvests, :months_to_completion, :integer
    add_column :harvests, :weeks_to_completion, :integer
    add_column :harvests, :days_to_completion, :integer
    add_column :harvests, :hours_to_completion, :integer
    add_column :harvests, :minutes_to_completion, :integer
  end
end
