require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  describe "Rental" do
    it "is valid when given valid input" do
      expected_count = Rental.count + 1
      Rental.create(customer_id: Customer.first.id, movie_id: Movie.first.id)
      Rental.count.must_equal expected_count
    end

    it "is invalid without customer_id and movie_id" do
        expected_count = Rental.count
        Rental.create(customer_id: nil, movie_id: Movie.first.id)
        Rental.count.must_equal expected_count
    end

  end
end
