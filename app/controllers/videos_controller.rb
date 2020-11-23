class VideosController < ApplicationController
  def index
    render json: Video.all.as_json(only: [:id, :title, :release_date, :available_inventory]), status: :ok
  end

  def show
    video = Video.find_by(id: params[:id].to_i)

    if video
      render json: video.as_json(only: [:title, :overview, :release_date, :available_inventory, :total_inventory]), status: :ok
    else
      render json: {
        "errors" => [
          "Not Found"
        ]
      }, status: :not_found
    end
  end

  def create
    video = Video.new(params.permit([:title, :overview, :release_date, :total_inventory, :available_inventory]))

    if video.save
      render json: {
        id: video.id,
      }, status: :created
    else
      render json: {
        "errors": 
          video.errors.messages
      }, status: :bad_request
    end
  end
end
