class RentalsController < ApplicationController
  def checkout
    #check for available inventory
    #going to need to accept movie id param from params
    #user param (also passed through params?)
    date = Date.today
    rental = Rental.new rental_params
    rental.checkout_date = date.to_s
    rental.due_date = (date + 7).to_s
    rental.save
  end

  def checkin
    #delete a rentals object that has params matching customer_id and movie_id
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
