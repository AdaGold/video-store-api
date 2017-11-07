class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie

  def self.set_checkout(rental)
    return rental.checkout_date = Date.today.to_s
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
    movie = rental.movie
    movie.available_inventory = movie.available_inventory 1
    movie.save
  end
end
