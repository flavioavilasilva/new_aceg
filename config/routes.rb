Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :pets, only: [:new, :create, :show, :index]
  resources :ongs, only: [:show, :index, :new, :create] do
    resources :events, only: [:new, :create]
  end
  resources :events, only: [:show]
end
