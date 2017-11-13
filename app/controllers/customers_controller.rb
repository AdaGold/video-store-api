class CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: customers, status: :ok
    # begin
    #   customers = Customer.sort_by(params[:sort])
    #   render json: customers, status: :ok
    # rescue ArgumentError
    #   render ok: false, status: :bad_request
    # end
  end
end
