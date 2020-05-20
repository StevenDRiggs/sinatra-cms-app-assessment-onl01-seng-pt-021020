class AddLoggedInToUser < ActiveRecord::Migration
  def change
    add_column :users, :logged_in, :boolean, null: false, default: false
  end
end
