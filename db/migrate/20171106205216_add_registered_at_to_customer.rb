class AddRegisteredAtToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :registered_at, :string
  end
end
