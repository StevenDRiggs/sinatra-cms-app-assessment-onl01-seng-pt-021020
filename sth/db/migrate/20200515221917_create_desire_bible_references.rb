class CreateDesireBibleReferences < ActiveRecord::Migration

  def change
    create_table :desire_bible_references do |t|
      t.integer :desire_id
      t.integer :bible_reference_id
    end
  end

end
