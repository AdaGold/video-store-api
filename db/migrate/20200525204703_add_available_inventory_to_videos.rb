class AddAvailableInventoryToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :available_inventory, :integer
  end
end
