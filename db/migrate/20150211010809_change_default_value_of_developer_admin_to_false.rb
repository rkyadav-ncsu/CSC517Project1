class ChangeDefaultValueOfDeveloperAdminToFalse < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, :default => 0
    change_column :users, :developer, :boolean, :default => 0
  end
end
