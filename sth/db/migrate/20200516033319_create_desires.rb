class CreateDesires < ActiveRecord::Migration
  def change
    create_table :desires do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
