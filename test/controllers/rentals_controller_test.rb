require 'test_helper'


class RentalsControllerTest < ActionDispatch::IntegrationTest

  describe "Checkout" do
    it "Should create an instance of rental" do
      rental = Rental.count

      post checkout_path, params: {customer_id: customers(:one).id, movie_id: movies(:one).id }

      rental.must_equal Rental.count - 1
    end

    it "Must have a customer id" do
      rental = Rental.count

      post checkout_path, params: {customer_id: nil, movie_id: movies(:one).id }

      rental.must_equal Rental.count
    end

    it "Must have a movie id" do
      rental = Rental.count

      post checkout_path, params: {customer_id: customers(:one).id, movie_id: nil }

      rental.must_equal Rental.count
    end

# TODO
    it "Checkout must be the date created" do
      proc {
        post checkout_path, params: {customer_id: customers(:one).id, movie_id: movies(:one).id }
      }.must_change "Rental.count", 1

      Rental.first.checkout_date.must_equal "MyString2"
      Rental.last.checkout_date.must_equal Date.today.to_s
    end

    it "Duedate should be 7 days from checkout date" do
      proc {
        post checkout_path, params: {customer_id: customers(:one).id, movie_id: movies(:one).id }
      }.must_change "Rental.count", 1

      Rental.last.due_date.must_equal (Date.today+7).to_s
    end

    it "Should decrease available inventory when a movie is checked out" do
      proc {
        post checkout_path, params: {customer_id: customers(:one).id, movie_id: movies(:one).id }
      }.must_change 'movies(:one).available_inventory', -1

    end

  end

  describe "Checkin" do
    it "Should require a user ID " do

    end

    it "Should have a movie ID" do

    end

    it "Should delete an instance of rental" do

    end

    it "Available inventory should increase once movie is checked in" do

    end
  end

  describe "Overdue" do
    it "Should return a list of Overdue rentals as of todays date" do

    end

    it "Cannot display are list of movies that are not yet overdue" do

    end
  end

end
