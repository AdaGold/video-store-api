class AddOverviewToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :overview, :string
  end
end
