class SetCheckOutDateToCreatedAt < ActiveRecord::Migration[5.1]
  def change
    change_column :rentals, :checkout_date, :string, :default => :created_at
  end
end
