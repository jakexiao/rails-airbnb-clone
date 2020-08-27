Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :flats
  get "/dashboard", to: "flats#dashboard"
  resources :bookings
  get "/dashboard", to: "bookings#dashboard"
  resources :bookings do
    resources :reviews, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
