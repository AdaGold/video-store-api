class MoviesController < ApplicationController
  def index
    movies = Movie.all
  render(
      json: movies.as_json(only: [:title, :overview, :release_date, :inventory, :id]), status: :ok
    )
  end

  def show
  end

  def create
  end
end
