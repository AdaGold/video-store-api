require "test_helper"

describe CustomersController do

  REQUIRED_CUSTOMER_FIELDS = ["id", "name", "registered_at", "postal_code", "phone", "videos_checked_out_count"].sort

  it "lists all customers" do
    get customers_path

    check_response(expected_type: Array)
  end
end
