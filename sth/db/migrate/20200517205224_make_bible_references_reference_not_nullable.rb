class MakeBibleReferencesReferenceNotNullable < ActiveRecord::Migration
  def change
    change_column_null :bible_references, :reference, false
  end
end
