class ChangeDefaultValueOfDeveloperAdminToFalse < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, :default => 'f'
    change_column :users, :developer, :boolean, :default => 'f'
  end
end
