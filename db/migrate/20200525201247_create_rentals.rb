class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.belongs_to :video
      t.belongs_to :customer
      t.timestamps
    end
  end
end
