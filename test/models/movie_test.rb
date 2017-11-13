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
      movie.available?.must_equal true
    end
  end

  describe "sort_by" do
    it "Returns a list sorted by ID if term is nil" do
      Movie.sort_by(nil, nil, nil).count.must_equal 2
      Movie.sort_by(nil, nil, nil).first.id.must_equal Movie.all.first.id
    end

    it "Sorts by valid params" do
      Movie.sort_by("title", nil, nil).count.must_equal 2
      Movie.sort_by("title", nil, nil).first.title.must_equal "a_test_title"
      Movie.sort_by("title", nil, nil).last.title.must_equal "test_title"
    end

    it "raises argument error if sort term is invalid" do
      proc {Movie.sort_by("girl", nil, nil)}.must_raise ArgumentError
    end

    it "displays n number of results per page (default 10)" do
      10.times do |i|
        Movie.create(title: "#{i}", inventory: i, available_inventory: i)
      end

      Movie.count.must_equal 12

      ten = Movie.sort_by("id", nil, nil)
      ten.length.must_equal 10
      ten.first.id.must_equal Movie.first.id
      ten.last.id.must_equal Movie.all[9].id
    end

    it "Raises an argument error if given invalid value for p" do
      proc  {Movie.sort_by("id", nil, "invalid")}.must_raise ArgumentError
    end

    it "Raises an argument error if given invalid value for n" do
      proc  {Movie.sort_by("id", "invalid", nil)}.must_raise ArgumentError
    end
  end


end
