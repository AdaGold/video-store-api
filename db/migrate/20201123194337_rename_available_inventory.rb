class RenameAvailableInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :total_inventory, :integer
  end
end
