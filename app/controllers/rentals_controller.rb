class RentalsController < ApplicationController
  def checkout
    #check for available inventory
    #going to need to accept movie id param from params
    #user param (also passed through params?)
  end

  def checkin
    #delete a rentals object that has params matching customer_id and movie_id
  end

  def overdue
    #search by today's date.
    #if due date < today's date, return
  end
end
