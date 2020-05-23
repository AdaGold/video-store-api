class VideosController < ApplicationController

  def index
    videos = Video.all.as_json(only: [:id, :title, :release_date])
    render json: videos, status: :ok
  end

  def show
    video = Video.find_by(id: params[:id]).as_json(only: [:title, :overview, :release_date, :total_inventory])

    render json: video, status: :ok
  end

  def create
    video = Video.new(video_params)

    if video.save
      render json: video.as_json(only: [:id]), status: :created
      return
    else
      # render json: {
      #     ok: false,
      #     errors: video.errors.messages
      #   }, status: :bad_request
      return
    end
  end

  private

  def video_params
    return params.require(:video).permit(:title, :overview, :release_date, :total_inventory)
  end
end
