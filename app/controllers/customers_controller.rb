class CustomersController < ApplicationController

  def index
    customers = Customer.all


    render json: customers.as_json(only: [:id, :name, :address, :city, :movies_checked_out_count, :state, :postal_code, :phone, :registered_at, :account_credit]), status: :ok

  end

end
