require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  describe "Rental" do
    it "is valid when given valid input" do
      expected_count = Rental.count + 1
      Rental.create(customer_id: Customer.first.id, movie_id: Movie.first.id)
      Rental.count.must_equal expected_count
    end

    it "is invalid without customer_id" do
        expected_count = Rental.count
        Rental.create(customer_id: nil, movie_id: Movie.first.id)
        Rental.count.must_equal expected_count
    end

    it "is invalid without customer_id" do
        expected_count = Rental.count
        Rental.create(customer_id: Customer.first.id, movie_id: nil)
        Rental.count.must_equal expected_count
    end
  end

  describe "set_checkout" do
    it "set_checkout must set a rental's checkout date to today" do
      r = Rental.create(movie: Movie.first, customer: Customer.first)
      r.valid?.must_equal true
      r.set_checkout
      r.checkout_date.must_equal Date.today.to_s
    end
  end

  describe "set_due" do
    it "must set the due date to 7 days after today's date" do
      r = Rental.create(movie: Movie.first, customer: Customer.first)
      date = Date.today + 7
      r.valid?.must_equal true
      r.set_due
      r.due_date.must_equal date.to_s
    end
  end
end
