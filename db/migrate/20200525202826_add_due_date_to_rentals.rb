class AddDueDateToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :due_date, :string
  end
end
