class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :release_date
      t.integer :available_inventory

      t.timestamps
    end
  end
end
