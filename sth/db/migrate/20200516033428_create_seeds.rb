class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|

      t.timestamps null: false
    end
  end
end
