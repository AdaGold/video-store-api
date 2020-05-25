require "test_helper"

describe VideosController do

  describe "index" do
    it "lists all videos" do
      get videos_path
  
      body = check_response(expected_type: Array)
  
      body.each do |video|
        expect(video).must_be_instance_of Hash
  
        expect(video.keys.sort).must_equal ["id", "title", "release_date"].sort
      end
    end
  end

  describe "show" do
    it "gets a video by id" do
      get video_path(videos(:valid_video).id)
  
      body = check_response(expected_type: Hash)

      expect(body.keys.sort).must_equal ["title", "overview", "release_date", "total_inventory", "available_inventory"].sort
    end
  end

  describe "create" do
    it "creates a video with valid data" do
      test_video_data = {
        video: {
          title: "Create Test Title",
          overview: "Create Test Overview",
          release_date: "Create Release Date",
          total_inventory: 5,
          available_inventory: 3
        }
      }

      expect {
        post videos_path, params: test_video_data
      }.must_differ "Video.count", 1

      body = check_response(expected_type: Hash, expected_status: :created)
      expect(body.keys).must_equal ["id"]
    end

    it "gives an error with invalid data" do
      
    end
  end

end
