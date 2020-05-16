class AddCompletedAndTimeToCompletionToHarvestSources < ActiveRecord::Migration

  def change
    add_column :harvest_sources, :completed, :boolean
    add_column :harvest_sources, :time_to_completion, :datetime
  end

end
