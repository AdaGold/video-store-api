Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :customers
  resources :videos

  post '/rentals/check-out', to: 'rentals#check_out', as: 'check_out'
end
