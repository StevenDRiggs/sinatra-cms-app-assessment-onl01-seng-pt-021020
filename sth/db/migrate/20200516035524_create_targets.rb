class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.decimal :money_sown
      t.decimal :money_to_sow
      t.datetime :time_sown
      t.datetime :time_to_sow
      t.timestamps null: false
    end
  end
end
