require "test_helper"

describe CustomersController do

  REQUIRED_CUSTOMER_FIELDS = ["id", "name", "registered_at", "postal_code", "phone", "videos_checked_out_count"].sort

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  it "lists all customers" do
    get customers_path

    check_response(expected_type: Array)
  end
end
