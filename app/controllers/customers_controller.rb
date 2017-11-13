class CustomersController < ApplicationController

  def index
    begin
      customers = Customer.sort_by(params[:sort], params[:n], params[:p])
      # render json: params
      render json: customers, status: :ok
    rescue ArgumentError
      render ok: false, status: :bad_request
    end
  end
end
