Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: :create
  end
  get "/dashboard", to: "flats#dashboard"
  resources :bookings
  get "/dashboard", to: "bookings#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
