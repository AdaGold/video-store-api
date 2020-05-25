class RentalsController < ApplicationController

  def check_out
    new_rental = Rental.new(rental_params)
    new_rental.due_date = (Date.today + 7).to_s
    new_rental.save

    customer = Customer.find_by(id: params[:customer_id])
    customer.update(videos_checked_out_count: customer.videos_checked_out_count + 1)

    video = Video.find_by(id: params[:video_id])
    video.update(available_inventory: video.available_inventory-1)

    render json: {
      id: new_rental.id,
      customer_id: new_rental.customer.id,
      video_id: new_rental.video.id,
      due_date: new_rental.due_date,
      videos_checked_out_count: new_rental.customer.videos_checked_out_count,
      available_inventory: new_rental.video.available_inventory
    }, status: :created
  end

  
  def rental_params
    return params.permit([:customer_id, :video_id])
  end

end
