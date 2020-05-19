class MakeTargetsNameNotNullable < ActiveRecord::Migration
  def change
    change_column_null :targets, :name, false
  end
end
