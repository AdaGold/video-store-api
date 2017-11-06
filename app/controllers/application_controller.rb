class ApplicationController < ActionController::API
  def zomg
    render json: {text: "It works!"}, response: :ok
  end
end
