class CustomersController < ApplicationController

  def index
    customers = Customer.all.as_json(only: [:id, :name, :registered_at, :postal_code, :phone])
    render json: pets, status: :ok
  end
end
