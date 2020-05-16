class CreateBibleReferenceDesires < ActiveRecord::Migration
  def change
    create_table :bible_reference_desires do |t|
      t.integer :bible_reference_id
      t.integer :desire_id
      t.timestamps null: false
    end
  end
end
