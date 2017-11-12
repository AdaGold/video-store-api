class CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: customers, status: :ok
  end

  def sort_by
    begin
      customers = Customer.sort_by(params[:sort])
        # render json: params
      render json: customers, status: :ok
    rescue ArgumentError
      render json: {ok: false, status: :bad_request}
    end
  end
end
