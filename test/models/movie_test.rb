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

  end

end
