require "test_helper"

describe CustomersController do
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
end
