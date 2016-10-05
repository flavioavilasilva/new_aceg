Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, only: [:new, :create, :show]
  root 'home#index'
  resources :ongs, only: [:show, :new, :create, :index]
end
