Rails.application.routes.draw do
  # resources :items, only: [:index] do
  #   resources :users, only: [:show, :index]
  # end
  resources :users, only: [:index, :show] do
      resources :items, only: [:show, :index, :create]
    end
  resources :items, only: [:index, :show, :create]
end
