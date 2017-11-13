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
      Customer.sort_by(nil, nil, nil).count.must_equal 3
      Customer.sort_by(nil, nil, nil).first.id.must_equal 1
    end

    it "Sorts by valid params" do
      Customer.sort_by("name", nil, nil).count.must_equal 3
      Customer.sort_by("name", nil, nil).first.name.must_equal "a_test_name1"
      Customer.sort_by("name", nil, nil).last.name.must_equal "test_name"
    end

    it "raises argument error if sort term is invalid" do
      proc {Customer.sort_by("girl", nil, nil)}.must_raise ArgumentError
    end

    it "displays n number of results per page (default 10)" do
      10.times do |i|
        Customer.create(name: "#{i}", movies_checked_out_count: i)
      end

      Customer.count.must_equal 13

      ten = Customer.sort_by("id", nil, nil)
      ten.length.must_equal 10
      ten.first.id.must_equal Customer.first.id
      ten.last.id.must_equal Customer.all[9].id
    end

    it "Raises an argument error if given invalid value for p" do
      proc  {Customer.sort_by("id", nil, "invalid")}.must_raise ArgumentError
    end

    it "Raises an argument error if given invalid value for n" do
      proc  {Customer.sort_by("id", "invalid", nil)}.must_raise ArgumentError
    end
  end
end
