Rails.application.routes.draw do
  root "static_pages#top"

  resources :tasks, only: %i[index new create destroy]
  resources :house_works, only: %i[index new create destroy]
  resources :results, only: %i[index]
  resources :users, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "login" => "user_sessions#new", as: :login
  post "login" => "user_sessions#create"
  delete "logout" => "user_sessions#destroy", as: :logout

  # Defines the root path route ("/")
  # root "posts#index"
end
