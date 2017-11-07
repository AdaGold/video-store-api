class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  def set_checkout
    self.checkout_date = Date.today.to_s
  end

  def set_due
    self.due_date = (Date.today + 7).to_s
  end

  def self.remove_inventory(rental)
    movie = Movie.find_by(id: rental.movie_id)
    inventory = movie.available_inventory - 1
    movie.available_inventory = inventory
    movie.save
  end

  def self.increase_inventory(rental)
    movie = Movie.find_by(id: rental.movie_id)
    movie.available_inventory += 1
    movie.save
  end
end
