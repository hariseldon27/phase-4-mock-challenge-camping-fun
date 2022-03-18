Rails.application.routes.draw do
  resources :signups, only: [:create]
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:show, :index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
