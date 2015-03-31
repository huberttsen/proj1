Rails.application.routes.draw do
  root to: 'home#index'
  get 'error', to: 'pokemon#new'
  patch 'capture', to: 'pokemon#capture'
  patch 'damage', to: 'trainers#damage'
  post 'new', to: 'pokemon#new'
  resources :pokemon
  devise_for :trainers
  resources :trainers
end
