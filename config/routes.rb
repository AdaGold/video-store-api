Rails.application.routes.draw do

  get 'movies', to: 'movies#index', as: 'movies'
  get 'movie/:id', to: 'movies#show', as: 'movie'
  post 'movie', to: 'movies#create', as: 'create_movie'
  get 'customers', to: 'customers#index', as: 'customers'

  get '/zomg', to: "application#zomg"

end
