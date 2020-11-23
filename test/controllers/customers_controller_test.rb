require "test_helper"

describe CustomersController do
  it "must get index" do
    # Act
    get customers_path
    body = JSON.parse(response.body)

    # Assert
    expect(body).must_be_instance_of Array
    expect(body.length).must_equal Customer.count

    # Check that each customer has the proper keys
    fields = ["id", "name", "registered_at", "postal_code", 
      "phone", "videos_checked_out_count"].sort

    body.each do |customer|
      expect(customer.keys.sort).must_equal fields
    end

    must_respond_with :ok
  end

  it "works even with no customers" do
    Customer.destroy_all

    get customers_path
    body = JSON.parse(response.body)

    expect(body).must_be_instance_of Array
    expect(body.length).must_equal 0

    must_respond_with :ok
  end

end
