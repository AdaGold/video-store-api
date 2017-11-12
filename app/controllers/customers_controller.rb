class CustomersController < ApplicationController

  def index
    customers = Customer.sort_by(params[:term])
    render json: customers, status: :ok
  end
end
