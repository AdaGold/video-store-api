Rails.application.routes.draw do

  get 'movies', to: 'movies#index', as: 'movies'
  get 'movies/:id', to: 'movies#show', as: 'movie'
  post 'movies', to: 'movies#create', as: 'create_movie'
  get 'customers', to: 'customers#index', as: 'customers'

  post 'rentals/checkout', to: 'rentals#checkout', as: 'checkout'
  post 'rentals/checkin', to: 'rentals#checkin', as: 'checkin'
  get 'rentals/overdue', to: 'rentals#overdue', as: 'overdue'

  get '/customers?sort=:field&n=:perpage&p=:page', to: 'customers#sort_by', as:'sort_by'

  get '/zomg', to: "application#zomg"

end
