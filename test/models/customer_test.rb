require 'test_helper'
#
class CustomerTest < ActiveSupport::TestCase
  describe Customer do
    let(:customer) {customers(:one)}
    it "must be valid" do
      customer.must_be :valid?
    end
  end
end
