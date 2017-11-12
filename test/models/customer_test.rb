require 'test_helper'
#
class CustomerTest < ActiveSupport::TestCase
  describe Customer do
    let(:customer) {customers(:one)}

    it "must be valid" do
      customer.must_be :valid?
    end

    it "won't be valid without a name" do
      customer.must_be :valid?
      customer.name = nil
      customer.wont_be :valid?
    end
  end

  describe "sort_by" do
    it "Returns a list sorted by ID if term is nil" do
      Customer.sort_by(nil).count.must_equal 3
      Customer.sort_by(nil).first.id.must_equal 1
    end

    it "Sorts by valid params" do
      Customer.sort_by("name").count.must_equal 3
      Customer.sort_by("name").first.name.must_equal "a_test_name1"
      Customer.sort_by("name").last.name.must_equal "test_name"
    end

    it "raises argument error if sort term is invalid" do
      Customer.sort_by("girl").errors.must_include("Invalid Sort Term")

    end
  end
end
