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

  it "returns all of the customers" do
    get customers_path

    body = JSON.parse(response.body)
    body.length.must_equal Customer.count
  end

  it "returns customers with the exact required fields" do
    keys = %w(account_credit address city movies_checked_out_count name phone registered_at state)

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
