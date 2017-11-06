class MoviesController < ApplicationController
  def index
    movies = Movie.all
  render(
      json: movies.as_json(only: [:title, :overview, :release_date, :inventory, :id]), status: :ok
    )
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render(
        json: movie.as_json(only: [:title, :overview, :release_date, :inventory, :id]), status: :ok
      )
    else
      render sjon: {ok: false}, status: :not_found
    end
  end

  def create
  end
end
