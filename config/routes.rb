Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :timecapsules, only: [:create, :index, :show, :destroy] do
    resources :memoryboxes, only: [:new, :create]
  end

  resources :memoryboxes, only: [:new, :create] do
    resources :memories, only: [:new, :create, :show, :destroy]
  end

    get "ownmemories", to: "memories#ownmemories", as: :ownmemories

  # Defines the root path route ("/")
  # root "posts#index"
end
