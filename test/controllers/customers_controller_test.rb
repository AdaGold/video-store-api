require "test_helper"

describe CustomersController do
  describe "index" do
    it "should get index " do
      get customers_path
      value(response).must_be :success?
    end

    it "Should get to index when there are no customers." do
      customer = Customer.all
      customer.destroy_all
      get customers_path
      must_respond_with :success
    end

    it "returns json" do
      get customers_path
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get customers_path

      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    it "returns all of the customers" do
      get customers_path

      body = JSON.parse(response.body)
      body.length.must_equal Customer.count
    end

    it "returns customers with the exact required fields" do
      keys = %w(account_credit address city id movies_checked_out_count name phone postal_code registered_at state )

      get customers_path
      body = JSON.parse(response.body)

      body.each do |customer|
        customer.keys.sort.must_equal keys
      end
    end

    it "Returns an empty array if there are no customers " do
      Customer.destroy_all

      get customers_path

      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
      body.must_be :empty?
    end
  end

  describe "index with optional params" do
    it "should get a list of customers sorted by ID if no term is given" do
      get customers_path
      value(response).must_be :success?
    end

    it "should get a list of customers sorted by term if " do
      get customers_path
      value(response).must_be :success?
    end

    it "should return a list of customers sorted by term when the terms are valid" do
      get customers_path, params: {sort: "girl"}
      value(response).must_be :success?
    end

  end
end
