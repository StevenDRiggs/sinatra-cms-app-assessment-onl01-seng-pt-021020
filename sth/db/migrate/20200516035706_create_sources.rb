class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.decimal :money_received
      t.datetime :time_received
      t.timestamps null: false
    end
  end
end
