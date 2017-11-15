Rails.application.routes.draw do

  get 'movies', to: 'movies#index', as: 'movies'
  # get '/movies?sort=sort&n=n&p=p', to: 'movies#index' as: 'movies_sorted'
  get 'movies/:id', to: 'movies#show', as: 'movie'
  post 'movies', to: 'movies#create', as: 'create_movie'

  get 'customers', to: 'customers#index', as: 'customers'
  # get "/customers?sort=sort&n=n&p=p", to: 'customers#index', as:'customers_sorted'



  post 'rentals/checkout', to: 'rentals#checkout', as: 'checkout'
  post 'rentals/checkin', to: 'rentals#checkin', as: 'checkin'
  get 'rentals/overdue', to: 'rentals#overdue', as: 'overdue'

  get '/zomg', to: "application#zomg", as: "zomg"

end
