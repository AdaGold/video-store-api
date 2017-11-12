require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  describe Movie do
    let(:movie) {movies(:one)}

    it "must be valid" do
      movie.must_be :valid?
    end

    it "Wont be valid without title" do
      movie.must_be :valid?
      movie.title = nil
      movie.wont_be :valid?
    end

    it "Wont be valid without inventory" do
      movie.must_be :valid?
      movie.inventory = nil
      movie.wont_be :valid?
    end

    it "A movie can be valid with a 0 inventory" do
      movie.must_be :valid?
      movie.inventory = 0
      movie.must_be :valid?
    end

    it "a movie is not valid with negative inventory" do
      movie.must_be :valid?
      movie.inventory = -1
      movie.wont_be :valid?
    end

    it "will not succeed unless the inventory is a number" do
      movie.must_be :valid?
      movie.inventory = "two"
      movie.wont_be :valid?
    end
  end

  describe "custom methods" do
    let(:movie) {movies(:one)}
    it "add_inventory increases available inventory by 1" do
      expected_inventory = movie.available_inventory + 1
      movie.add_inventory
      movie.available_inventory.must_equal expected_inventory
    end

    it "remove_inventory decreases available inventory by 1" do
      expected_inventory = movie.available_inventory - 1
      movie.remove_inventory
      movie.available_inventory.must_equal expected_inventory
    end

    it "available? returns true if there is available inventory for a movie" do
      movie.available_inventory.must_equal 1
      # movie.available?.must_equal true

    end

  end
end
