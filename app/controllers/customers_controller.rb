class CustomersController < ApplicationController

  def index
    begin
      customers = Customer.sort_by(params[:sort])
        # render json: params
        render json: customers, status: :ok
    rescue ArgumentError
       render status: :bad_request
    end
  end
end
