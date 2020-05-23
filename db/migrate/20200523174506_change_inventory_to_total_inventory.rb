class ChangeInventoryToTotalInventory < ActiveRecord::Migration[6.0]
  def change
    rename_column :videos, :inventory, :total_inventory
  end
end
