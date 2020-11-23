require "test_helper"

describe VideosController do
  describe "index" do
    it "must get index" do
      # Act
      get videos_path
      body = JSON.parse(response.body)

      # Assert
      expect(body).must_be_instance_of Array
      expect(body.length).must_equal Video.count

      # Check that each customer has the proper keys
      fields = ["id", "title", "release_date", "available_inventory"].sort

      body.each do |customer|
        expect(customer.keys.sort).must_equal fields
      end

      must_respond_with :ok
    end

    it "works even with no videos" do
      # Arrange
      Video.destroy_all

      # Act
      get videos_path
      body = JSON.parse(response.body)

      # Assert
      expect(body).must_be_instance_of Array
      expect(body.length).must_equal 0

      must_respond_with :ok
    end
  end

  describe "show" do
    it "can get a video" do
      # Arrange
      wonder_woman = videos(:wonder_woman)

      # Act
      get video_path(wonder_woman.id)
      body = JSON.parse(response.body)

      # Assert
      fields = ["title", "overview", "release_date", "total_inventory", "available_inventory"].sort
      expect(body.keys.sort).must_equal fields
      expect(body["title"]).must_equal "Wonder Woman 2"
      expect(body["release_date"]).must_equal "December 25th 2020"
      expect(body["available_inventory"]).must_equal 100
      expect(body["overview"]).must_equal "Wonder Woman squares off against Maxwell Lord and the Cheetah, a villainess who possesses superhuman strength and agility."
      expect(body["total_inventory"]).must_equal 100
      
      must_respond_with :ok
    end

    it "responds with a 404 for non-existant videos" do
      # Act
      get video_path(-1)
      body = JSON.parse(response.body)

      # Assert
      expect(body.keys).must_include "errors"
      expect(body["errors"]).must_include  "Not Found"
      must_respond_with :not_found      
    end
  end

  describe "create" do
    it "can create a valid video" do
      # Arrange
      video_hash = {
        title: "Alf the movie",
        overview: "The most early 90s movie of all time",
        release_date: "December 16th 2025",
        total_inventory: 6,
        available_inventory: 6
      }

      # Assert
      expect {
        post videos_path, params: video_hash
      }.must_change "Video.count", 1

      must_respond_with :created
    end

    it "will respond with bad request and errors for an invalid movie" do
      # Arrange
      video_hash = {
        title: "Alf the movie",
        overview: "The most early 90s movie of all time",
        release_date: "December 16th 2025",
        total_inventory: 6,
        available_inventory: 6
      }
  
      video_hash[:title] = nil
  
      # Assert
      expect {
        post videos_path, params: video_hash
      }.wont_change "Video.count"
      body = JSON.parse(response.body)

      expect(body.keys).must_include "errors"
      expect(body["errors"].keys).must_include "title"
      expect(body["errors"]["title"]).must_include "can't be blank"
  
      must_respond_with :bad_request
    end
  end
end
