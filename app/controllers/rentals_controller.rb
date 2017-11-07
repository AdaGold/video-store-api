
class RentalsController < ApplicationController
  def checkout
    if params[:movie_id] && Rental.available?(params[:movie_id].to_i)
      rental = Rental.new rental_params
      rental.set_checkout
      puts "#{rental.checkout_date}"
      Rental.set_due(rental)
      # rental.save
      if rental.save
        Rental.remove_inventory(rental)
        render json: rental, status: :ok
      else
        render ok: false, status: :bad_request
      end
    else
      render ok: false, status: :bad_request
    end
  end

  def checkin
    #delete a rentals object that has params matching customer_id and movie_id
    checkin_rental = Rental.find_by(customer_id: params[:customer_id], movie_id: params[:movie_id])
    if checkin_rental
      checkin_rental.destroy
      render(status: :ok)
    else
      render(ok: false, status: :bad_request)
    end
  end

  def overdue
    #search by today's date.
    #if due date < today's date, return
  end

  private
  def rental_params
    params.permit(:customer_id, :movie_id)
  end
end
