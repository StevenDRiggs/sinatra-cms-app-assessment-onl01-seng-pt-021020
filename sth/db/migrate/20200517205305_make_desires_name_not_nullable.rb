class MakeDesiresNameNotNullable < ActiveRecord::Migration
  def change
    change_column_null :desires, :name, false
  end
end
