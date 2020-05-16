class CreateBibleReferences < ActiveRecord::Migration
  def change
    create_table :bible_references do |t|
      t.string :reference
      t.text :content
      t.timestamps null: false
    end
  end
end
