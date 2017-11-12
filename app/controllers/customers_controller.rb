class CustomersController < ApplicationController

  def index
    begin
      customers = Customer.sort_by("girl")
        render json: customers, status: :ok
    rescue
       render status: :bad_request
    end
  end
end
