Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: "pages#front"
  get "/home", to: "videos#index"
  get "/register", to: "users#new"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "sign_out", to: "sessions#destroy"
  get "my_queue", to: "queue_items#index"
  get "people", to: "relationships#index"
  resources :relationships, only: [:destroy, :create]

  resources :videos do

    collection do
      get "search", to: "videos#search"
    end
    resources :reviews, only: [:create]
  end

  resources :users

  resources :categories, only: [:index, :show]
  resources :queue_items, only: [:create, :destroy]

  post "update_queue", to: "queue_items#update_queue"
  resources :users, only: [:create]

  get "forgot_password", to: "forgot_passwords#new"
  resources :forgot_passwords, only: [:create]


end
