class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  def set_checkout
    self.checkout_date = Date.today.to_s
  end

  def self.set_due(rental)
    rental.due_date = (Date.today + 7).to_s
  end

  def self.available?(movie_id)
    movie = Movie.find_by(id: movie_id)
    if movie.available_inventory > 0
      return true
    else
      return false
    end
  end

  def self.remove_inventory(rental)
    movie = Movie.find_by(id: rental.movie_id)
    inventory = movie.available_inventory - 1
    movie.available_inventory = inventory
    movie.save
  end
end
