class AddAccountCreditToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :account_credit, :decimal
  end
end
