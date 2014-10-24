class AddDefaultValueToResolved < ActiveRecord::Migration
  def change
    change_column :issues, :resolved, :boolean, :default => false
  end
end
