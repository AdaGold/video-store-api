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
      #not working!

      movie = Movie.find_by(id: movies(:one).id)
      expected_movie_inventory = movie.available_inventory - 1

        post checkout_path, params: {customer_id: customers(:one).id, movie_id: movie.id}

      Movie.find_by(id: movies(:one).id).available_inventory.must_equal expected_movie_inventory
    end

    it "shouldn't allow a checkout for a movie whose available inventory is 0" do
       proc {
          post checkout_path, params: {customer_id: customers(:one).id, movie_id: movies(:two).id }
        }.must_change 'movies(:one).available_inventory', 0
    end

  end

  describe "Checkin" do
    it "Should check in a movie with required params" do
      expected_rental = Rental.count - 1

      post checkin_path, params: {customer_id: customers(:one).id, movie_id: movies(:one).id}

      expected_rental.must_equal Rental.count
    end

    it "Should require a user ID " do
      rental = Rental.count

      post checkin_path, params: {customer_id: nil, movie_id: movies(:one).id}

      rental.must_equal Rental.count
    end

    it "Should have a movie ID" do
      rental = Rental.count

      post checkin_path, params: {customer_id: customers(:one).id, movie_id: nil}

      rental.must_equal Rental.count

    end

    it "Available inventory should increase once movie is checked in" do
      movie = Movie.find_by(id: movies(:one).id)
      expected_movie_inventory = movie.available_inventory + 1

      post checkin_path, params: { customer_id: customers(:one).id, movie_id: movies(:one).id }

    Movie.find_by(id: movies(:one).id).available_inventory.must_equal expected_movie_inventory
    end
  end

  describe "Overdue" do
    it "Should return a list of Overdue rentals as of todays date" do
      get overdue_path
      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.length.must_equal 1

    end

    it "returns an empty array if there are no overdue movies" do
      rentals(:one).due_date = Date.today.to_s
      rentals(:one).save

      get overdue_path
      must_respond_with :success

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.length.must_equal 0
    end
  end

end
