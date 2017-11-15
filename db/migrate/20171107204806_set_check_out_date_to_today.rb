class SetCheckOutDateToToday < ActiveRecord::Migration[5.1]
  def change
    change_column :rentals, :checkout_date, :string, :default => Date.today.to_s
  end
end
